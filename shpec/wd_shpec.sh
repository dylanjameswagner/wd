source $SHPEC_ROOT/../wd

describe "wd"
  wdd="$(_wdd)"
  describe "adding a warp point"
    it "creates a symlink"
      wd add test_point &> /dev/null

      assert file_present "$wdd/test_point"

      rm "$wdd/test_point"
    end

    it "handles paths with spaces"
      path_with_spaces="/tmp/file with spaces/"
      mkdir -p "$path_with_spaces" && cd "$path_with_spaces"
      wd add spaces &> /dev/null
      saved_point="$(wd spaces && pwd)"

      assert equal "$saved_point" "$(pwd)"

      rm "$wdd/spaces"
      rmdir "$path_with_spaces"
    end
  end

  describe "removing a warp point"
    it "removes a symlink"
      wd add test_point &> /dev/null
      wd rm test_point &> /dev/null

      assert file_absent $HOME/.wdd/test_point

      rm "$wdd/test_point" &> /dev/null
    end
  end

  describe "warping to a point"
    it "changes your working directory"
      cd /tmp
      wd add test_point &> /dev/null
      cd - &> /dev/null
      warped_pwd="$(wd test_point && pwd)"

      assert equal "$warped_pwd" "/tmp"

      rm "$wdd/test_point"
    end

    it "changes to the previous working directory"
      expected_wd=$(pwd)
      cd /tmp && wd - &> /dev/null

      assert equal "$expected_wd" "$(pwd)"
    end

    it "allows subfolders"
      cd /tmp
      mkdir subfolder
      wd add test_point &> /dev/null
      cd - &> /dev/null
      warped_pwd="$(wd test_point/subfolder && pwd)"

      assert equal "$warped_pwd" "/tmp/subfolder"

      rm "$wdd/test_point"
      rmdir /tmp/subfolder
    end
  end

  describe "listing your warp points"
    it "lists points with spaces"
      path_with_spaces="/tmp/file with spaces/"
      mkdir -p "$path_with_spaces" && cd "$path_with_spaces"
      wd add spaces &> /dev/null

      assert match "$(wd ls | grep spaces)" "file\ with\ spaces"

      rm "$wdd/spaces"
      rmdir "$path_with_spaces"
    end
  end
end

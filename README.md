# ColorCursor

A simple script to convert Project Sekai cursor assets into a Linux-compatible theme. Inspired by rhythm games and virtual performances.

Special thanks to safeusernameig.

## Instructions

Download the script (`ColorCursor.sh`) from this repository. Download Project Sekai cursors [here](https://www.colorfulstage.com/media/download/). Extract the cursor assets to `~/Downloads/Miku`. To give execute permissions to the script, run `chmod +x ./ColorCursor.sh`. Finally, to run the script, execute `./ColorCursor.sh`.

## What does this script do?

This script initially defines the variables to be used later:
```
SRC_DIR="Miku"
DST_DIR="Miku-L"
```

In order to convert those Windows cursor assets to X11 cursors usable in Linux, we need to install `win2xcur` and relevant dependencies:
```
sudo apt install python3-pip python3.12-venv > /dev/null 2>&1
python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
pip install win2xcur > /dev/null 2>&1
```

The script will then change current working directory to `~/Downloads`, check if `~/Downloads/Miku` is present, and make EXPORT directories if not yet present:
```
cd ~/Downloads > /dev/null 2>&1

if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory '$SRC_DIR' does not exist in $(pwd)."
    echo "Please make sure the folder is in the correct location."
    exit 1
fi

mkdir -p "$DST_DIR/cursors"
```

It will ask whether you're converting animated assets or not:
```
read -p "Are you converting animated assets? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        FMT=".ani"
    ;;
    * )
        FMT=".cur"
    ;;
esac
```

It will then loop through the assets and duly convert them to the proper format:
```
files=(Alternate Busy Diagonal1 Diagonal2 Handwriting Help Horizontal Link Move Normal Person Pin Precision Text Unavailable Vertical Working)

missing=0
for f in "${files[@]}"; do
    if [ ! -f "$SRC_DIR/$f$FMT" ]; then
        echo "Missing file: $SRC_DIR/$f$FMT"
        missing=1
    fi
done

if [ "$missing" -eq 1 ]; then
    echo ""
    echo "Error: Some required $FMT files are missing."
    echo "Please double-check your asset format and folder."
    rm -rf "$DST_DIR"
    exit 1
fi

for f in "${files[@]}"; do
    win2xcur "$SRC_DIR/$f$FMT" -o "$DST_DIR/"
done
```

There is a long section that follows afterwards from line 55 to 200 that prepares the assets to conform to the Linux cursor naming standard. To confirm, view `/usr/share/icons/Yaru/cursors` or any similar counterpart.

The script will ask you what name will you give the theme. This will rename the `DST_DIR` (Miku-L) to your preferred String.
```
read -p "Enter theme name: " THM_DIR
mv "$DST_DIR" "$THM_DIR"
```

The script also handles making simple `cursor.theme` and `index.theme` files from line 205 to line 214, in order for the system to recognize it as a proper theme.

As execution finishes, the script will prompt you to zip and install the themes system-wide. Average execution time should take around ten seconds.

## Note

The PRJSK cursor assets are rather limited, at 17 items. This is rather stale in comparison to Linux's roughly 140, following [Yaru's](https://github.com/ubuntu/yaru) practices. Therefore, it is expected that some assets are designated to fallback to PRJSK's Normal.

Thus, there may also be some asset mismatch. In event of such, please file an issue or a pull request. I'll try to act on it as soon as I can.

## Disclaimer

This repository does not provide any assets. You are required to fetch them by your own, as from above instructions. This is deliberate to prevent any copyright infringement. Therefore, you are also requested not to redistribute your converted assets.

HATSUNE MIKU: COLORFUL STAGE! is a copyrighted property of Colorful Palette Inc., Crypton Future Media INC, and SEGA CORPORATION. Reproduction or redistribution without permission from the copyright holder is prohibited.
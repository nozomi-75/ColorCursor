#!/bin/bash

asset_source_directory="Miku"
asset_destination_directory="Miku-L"

echo "Script running, standby..."

sudo apt install python3-pip python3.12-venv > /dev/null 2>&1
python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
pip install win2xcur > /dev/null 2>&1

cd ~/Downloads > /dev/null 2>&1

if [ ! -d "$asset_source_directory" ]; then
    echo "Error: Source directory '$asset_source_directory' does not exist in $(pwd)."
    echo "Please make sure the folder is in the correct location."
    exit 1
fi

mkdir -p "$asset_destination_directory/cursors"

read -p "Are you converting animated assets? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        FMT=".ani"
    ;;
    * )
        FMT=".cur"
    ;;
esac

files=(Alternate Busy Diagonal1 Diagonal2 Handwriting Help Horizontal Link Move Normal Person Pin Precision Text Unavailable Vertical Working)

missing=0
for f in "${files[@]}"; do
    if [ ! -f "$asset_source_directory/$f$FMT" ]; then
        echo "Missing file: $asset_source_directory/$f$FMT"
        missing=1
    fi
done

if [ "$missing" -eq 1 ]; then
    echo ""
    echo "Error: Some required $FMT files are missing."
    echo "Please double-check your asset format and folder."
    rm -rf "$asset_destination_directory"
    exit 1
fi

for f in "${files[@]}"; do
    win2xcur "$asset_source_directory/$f$FMT" -o "$asset_destination_directory/"
done

cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/03b6e0fcb3499374a867c041f52298f0"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/3ecb610c1bf2410f44200f48c40d3599"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/08e8e1c95fe2fc01f976f1e063a24ccd"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/9d800788f1b08800ae810202380a0822"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/14fef782d02440884392942c11205230"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/640fb0e74195791501fd1ed57b41487f"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/1081e37283d90000800003c07f3ef6bf"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/2870a09082c103050810ffdffffe0204"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/3085a0e285430894940527032f8b26df"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/4498f0e0c1937ffe01fd06f973665830"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/6407b0e94181790501fd1e167b474872"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/00000000000000020006000e7e9ffc3f"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/028006030e0e7ebffc7f7070c0600140"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/9081237383d90e509aa00f00170e968f"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/00008160000006810000408080010102"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/a2a266d0498c3104214a47bd64ab0fc8"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/alias"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/all-scroll"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/arrow"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/bd_double_arrow"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/bottom_left_corner"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/bottom_right_corner"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/bottom_side"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/bottom_tee"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/c7088f0f3e6c8088236ef8e1e3e70000"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/cell"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/circle"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/closedhand"
cp "$asset_destination_directory/Pin" "$asset_destination_directory/cursors/color-picker"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/col-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/context-menu"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/copy"
cp "$asset_destination_directory/Precision" "$asset_destination_directory/cursors/cross"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/crossed_circle"
cp "$asset_destination_directory/Precision" "$asset_destination_directory/cursors/crosshair"
cp "$asset_destination_directory/Precision" "$asset_destination_directory/cursors/cross_reverse"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/d9ce0ab605698f320427677b458ad60b"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/default"
cp "$asset_destination_directory/Precision" "$asset_destination_directory/cursors/diamond_cross"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/dnd-ask"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/dnd-copy"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/dnd-link"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/dnd-move"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/dnd-no-drop"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/dnd-none"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/dotbox"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/dot_box_mask"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/double_arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/down-arrow"
cp "$asset_destination_directory/Handwriting" "$asset_destination_directory/cursors/draft"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/draft_large"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/draft_small"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/draped_box"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/e29285e634086352946a0e7090d73106"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/e-resize"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/ew-resize"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/fcf1c3c7cd4491d801f1e1c78f100000"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/fcf21c00b30f7e3f83fe0dfd12e71cff"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/fd_double_arrow"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/fleur"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/forbidden"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/grab"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/grabbing"
cp "$asset_destination_directory/Working" "$asset_destination_directory/cursors/half-busy"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/hand"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/hand1"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/hand2"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/h_double_arrow"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/help"
cp "$asset_destination_directory/Text" "$asset_destination_directory/cursors/ibeam"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/icon"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/left-arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/left_ptr"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/left_ptr_help"
cp "$asset_destination_directory/Working" "$asset_destination_directory/cursors/left_ptr_watch"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/left_side"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/left_tee"
cp "$asset_destination_directory/Link" "$asset_destination_directory/cursors/link"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/ll_angle"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/lr_angle"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/move"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/ne-resize"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/nesw-resize"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/no-drop"
cp "$asset_destination_directory/Unavailable" "$asset_destination_directory/cursors/not-allowed"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/n-resize"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/ns-resize"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/nw-resize"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/nwse-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/openhand"
cp "$asset_destination_directory/Handwriting" "$asset_destination_directory/cursors/pencil"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/pirate"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/plus"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/pointer"
cp "$asset_destination_directory/Move" "$asset_destination_directory/cursors/pointer-move"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/pointing_hand"
cp "$asset_destination_directory/Working" "$asset_destination_directory/cursors/progress"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/question_arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/right-arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/right_ptr"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/right_side"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/right_tee"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/row-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/sb_down_arrow"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/sb_h_double_arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/sb_left_arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/sb_right_arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/sb_up_arrow"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/sb_v_double_arrow"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/se-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/size_all"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/size-bdiag"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/size-fdiag"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/size-hor"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/size-ver"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/split-h"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/split_v"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/s-resize"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/sw-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/target"
cp "$asset_destination_directory/Precision" "$asset_destination_directory/cursors/tcross"
cp "$asset_destination_directory/Text" "$asset_destination_directory/cursors/text"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/top_left_arrow"
cp "$asset_destination_directory/Diagonal1" "$asset_destination_directory/cursors/top_left_corner"
cp "$asset_destination_directory/Diagonal2" "$asset_destination_directory/cursors/top_right_corner"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/top_side"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/top_tee"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/ul_angle"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/up-arrow"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/ur_angle"
cp "$asset_destination_directory/Vertical" "$asset_destination_directory/cursors/v_double_arrow"
cp "$asset_destination_directory/Text" "$asset_destination_directory/cursors/vertical-text"
cp "$asset_destination_directory/Working" "$asset_destination_directory/cursors/wait"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/wayland-cursor"
cp "$asset_destination_directory/Help" "$asset_destination_directory/cursors/whats_this"
cp "$asset_destination_directory/Horizontal" "$asset_destination_directory/cursors/w-resize"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/x-cursor"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/X_cursor"
cp "$asset_destination_directory/Text" "$asset_destination_directory/cursors/xterm"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/zoom-in"
cp "$asset_destination_directory/Normal" "$asset_destination_directory/cursors/zoom-out"

for f in "${files[@]}"; do
    rm -f "$asset_destination_directory/$f"
done

read -p "Enter theme name: " theme_dirname
mv "$asset_destination_directory" "$theme_dirname"

cat > "$theme_dirname/cursor.theme" <<EOF
[Icon Theme]
Name=$theme_dirname
EOF

cat > "$theme_dirname/index.theme" <<EOF
[Icon Theme]
Name=$theme_dirname
Comment=Linux port of Project Sekai cursors. Copyright of SEGA Corp. and Colorful Palette Inc. Hatsune Miku is copyright of Crypton Future Media Inc.
EOF

echo -e "\n"

read -p "Do you want to zip the theme? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        sudo apt install zip > /dev/null 2>&1
        zip -r "$theme_dirname".zip "$theme_dirname" > /dev/null 2>&1
        echo -e "Successfully zipped theme.\n"
    ;;
    * )
        echo -e "Skipped zipping theme.\n"
    ;;
esac

read -p "Do you want to install this theme system-wide? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        sudo cp -r "$theme_dirname" /usr/share/icons/
        echo -e "Successfully installed theme.\n"
    ;;
    * )
        echo -e "Skipped installation of theme.\n"
    ;;
esac

echo -e "\e[1;32mFinished setup. Enjoy ColorCursor!\n"

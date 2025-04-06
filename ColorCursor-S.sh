#!/bin/bash

SRC_DIR="Miku"
DST_DIR="Miku-L"

echo "Script running, standby..."

sudo apt install python3-pip python3.12-venv > /dev/null 2>&1
python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
pip install win2xcur > /dev/null 2>&1

cd ~/Downloads > /dev/null 2>&1

if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory '$SRC_DIR' does not exist in $(pwd)."
    echo "Please make sure the folder is in the correct location."
    exit 1
fi

mkdir -p "$DST_DIR/cursors"

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

cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/03b6e0fcb3499374a867c041f52298f0"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/3ecb610c1bf2410f44200f48c40d3599"
cp "$DST_DIR/Help" "$DST_DIR/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/08e8e1c95fe2fc01f976f1e063a24ccd"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/9d800788f1b08800ae810202380a0822"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/14fef782d02440884392942c11205230"
cp "$DST_DIR/Link" "$DST_DIR/cursors/640fb0e74195791501fd1ed57b41487f"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/1081e37283d90000800003c07f3ef6bf"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/2870a09082c103050810ffdffffe0204"
cp "$DST_DIR/Link" "$DST_DIR/cursors/3085a0e285430894940527032f8b26df"
cp "$DST_DIR/Move" "$DST_DIR/cursors/4498f0e0c1937ffe01fd06f973665830"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/6407b0e94181790501fd1e167b474872"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/00000000000000020006000e7e9ffc3f"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/028006030e0e7ebffc7f7070c0600140"
cp "$DST_DIR/Move" "$DST_DIR/cursors/9081237383d90e509aa00f00170e968f"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/00008160000006810000408080010102"
cp "$DST_DIR/Link" "$DST_DIR/cursors/a2a266d0498c3104214a47bd64ab0fc8"
cp "$DST_DIR/Link" "$DST_DIR/cursors/alias"
cp "$DST_DIR/Move" "$DST_DIR/cursors/all-scroll"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/arrow"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/bd_double_arrow"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/bottom_left_corner"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/bottom_right_corner"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/bottom_side"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/bottom_tee"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/c7088f0f3e6c8088236ef8e1e3e70000"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/cell"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/circle"
cp "$DST_DIR/Move" "$DST_DIR/cursors/closedhand"
cp "$DST_DIR/Pin" "$DST_DIR/cursors/color-picker"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/col-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/context-menu"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/copy"
cp "$DST_DIR/Precision" "$DST_DIR/cursors/cross"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/crossed_circle"
cp "$DST_DIR/Precision" "$DST_DIR/cursors/crosshair"
cp "$DST_DIR/Precision" "$DST_DIR/cursors/cross_reverse"
cp "$DST_DIR/Help" "$DST_DIR/cursors/d9ce0ab605698f320427677b458ad60b"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/default"
cp "$DST_DIR/Precision" "$DST_DIR/cursors/diamond_cross"
cp "$DST_DIR/Help" "$DST_DIR/cursors/dnd-ask"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/dnd-copy"
cp "$DST_DIR/Link" "$DST_DIR/cursors/dnd-link"
cp "$DST_DIR/Move" "$DST_DIR/cursors/dnd-move"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/dnd-no-drop"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/dnd-none"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/dotbox"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/dot_box_mask"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/double_arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/down-arrow"
cp "$DST_DIR/Handwriting" "$DST_DIR/cursors/draft"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/draft_large"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/draft_small"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/draped_box"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/e29285e634086352946a0e7090d73106"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/e-resize"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/ew-resize"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/fcf1c3c7cd4491d801f1e1c78f100000"
cp "$DST_DIR/Move" "$DST_DIR/cursors/fcf21c00b30f7e3f83fe0dfd12e71cff"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/fd_double_arrow"
cp "$DST_DIR/Move" "$DST_DIR/cursors/fleur"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/forbidden"
cp "$DST_DIR/Move" "$DST_DIR/cursors/grab"
cp "$DST_DIR/Move" "$DST_DIR/cursors/grabbing"
cp "$DST_DIR/Working" "$DST_DIR/cursors/half-busy"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/hand"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/hand1"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/hand2"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/h_double_arrow"
cp "$DST_DIR/Help" "$DST_DIR/cursors/help"
cp "$DST_DIR/Text" "$DST_DIR/cursors/ibeam"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/icon"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/left-arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/left_ptr"
cp "$DST_DIR/Help" "$DST_DIR/cursors/left_ptr_help"
cp "$DST_DIR/Working" "$DST_DIR/cursors/left_ptr_watch"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/left_side"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/left_tee"
cp "$DST_DIR/Link" "$DST_DIR/cursors/link"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/ll_angle"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/lr_angle"
cp "$DST_DIR/Move" "$DST_DIR/cursors/move"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/ne-resize"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/nesw-resize"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/no-drop"
cp "$DST_DIR/Unavailable" "$DST_DIR/cursors/not-allowed"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/n-resize"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/ns-resize"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/nw-resize"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/nwse-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/openhand"
cp "$DST_DIR/Handwriting" "$DST_DIR/cursors/pencil"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/pirate"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/plus"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/pointer"
cp "$DST_DIR/Move" "$DST_DIR/cursors/pointer-move"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/pointing_hand"
cp "$DST_DIR/Working" "$DST_DIR/cursors/progress"
cp "$DST_DIR/Help" "$DST_DIR/cursors/question_arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/right-arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/right_ptr"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/right_side"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/right_tee"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/row-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/sb_down_arrow"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/sb_h_double_arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/sb_left_arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/sb_right_arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/sb_up_arrow"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/sb_v_double_arrow"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/se-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/size_all"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/size-bdiag"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/size-fdiag"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/size-hor"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/size-ver"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/split-h"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/split_v"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/s-resize"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/sw-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/target"
cp "$DST_DIR/Precision" "$DST_DIR/cursors/tcross"
cp "$DST_DIR/Text" "$DST_DIR/cursors/text"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/top_left_arrow"
cp "$DST_DIR/Diagonal1" "$DST_DIR/cursors/top_left_corner"
cp "$DST_DIR/Diagonal2" "$DST_DIR/cursors/top_right_corner"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/top_side"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/top_tee"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/ul_angle"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/up-arrow"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/ur_angle"
cp "$DST_DIR/Vertical" "$DST_DIR/cursors/v_double_arrow"
cp "$DST_DIR/Text" "$DST_DIR/cursors/vertical-text"
cp "$DST_DIR/Working" "$DST_DIR/cursors/wait"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/wayland-cursor"
cp "$DST_DIR/Help" "$DST_DIR/cursors/whats_this"
cp "$DST_DIR/Horizontal" "$DST_DIR/cursors/w-resize"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/x-cursor"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/X_cursor"
cp "$DST_DIR/Text" "$DST_DIR/cursors/xterm"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/zoom-in"
cp "$DST_DIR/Normal" "$DST_DIR/cursors/zoom-out"

for f in "${files[@]}"; do
    rm -f "$DST_DIR/$f"
done

read -p "Enter theme name: " THM_DIR
mv "$DST_DIR" "$THM_DIR"

cat > "$THM_DIR/cursor.theme" <<EOF
[Icon Theme]
Name=$THM_DIR
EOF

cat > "$THM_DIR/index.theme" <<EOF
[Icon Theme]
Name=$THM_DIR
Comment=Linux port of Project Sekai cursors. Copyright of SEGA Corp. and Colorful Palette Inc. Hatsune Miku is copyright of Crypton Future Media Inc.
EOF

echo -e "\n"

read -p "Do you want to zip the theme? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        sudo apt install zip > /dev/null 2>&1
        zip -r "$THM_DIR".zip "$THM_DIR" > /dev/null 2>&1
        echo -e "Successfully zipped theme.\n"
    ;;
    * )
        echo -e "Skipped zipping theme.\n"
    ;;
esac

read -p "Do you want to install this theme system-wide? (y/n): " answer
case ${answer:0:1} in
    y|Y )
        sudo cp -r "$THM_DIR" /usr/share/icons/
        echo -e "Successfully installed theme.\n"
    ;;
    * )
        echo -e "Skipped installation of theme.\n"
    ;;
esac

echo -e "\e[1;32mFinished setup. Enjoy ColorCursor!\n"
#!/bin/bash

SRC_DIR="Miku"
DST_DIR="Miku-L"
DWD_FNM="ps-cur.zip"

sudo apt install python3-pip python3.12-venv wget zip > /dev/null 2>&1
cd ~/Downloads > /dev/null 2>&1

echo -e "\nWelcome to ColorCursor-NG!\n"

theme_download() {
    if wget "$THM_URL" -O "$DWD_FNM" > /dev/null 2>&1; then
        echo -e "\nDownload successful!"
    else
        echo -e "\nDownload failed."
        exit 0
    fi
}

cursor_choices() {
    echo "Choose a cursor asset to download:"
    echo "1) Miku: Virtual Singer"
    echo "2) Miku: Leo/Need"
    echo "3) Miku: MORE MORE JUMP!"
    echo "4) Miku: Vivid BAD SQUAD"
    echo "5) Miku: Wonderlands Showtime"
    echo "6) Miku: Nightcord at 25:00"
    echo -e "7) Exit\n"
}

animated_cursors() {
    while true; do
        cursor_choices

        read -p "Enter your choice [1-7]: " choice

        case $choice in
            1)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-VirtualSinger.zip"
                theme_download
                break
                ;;
            2)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-leoneed.zip"
                theme_download
                break
                ;;
            3)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-MMJ.zip"
                theme_download
                break
                ;;
            4)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-VBS.zip"
                theme_download
                break
                ;;
            5)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation%20WxS.zip"
                theme_download
                break
                ;;
            6)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-N25.zip"
                theme_download
                break
                ;;
            7)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid selection. Try again."
                ;;
        esac
    done
}

static_cursors() {
    while true; do
        cursor_choices

        read -p "Enter your choice [1-7]: " choice

        case $choice in
            1)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-VirtualSinger.zip"
                theme_download
                break
                ;;
            2)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-leoneed.zip"
                theme_download
                break
                ;;
            3)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-MMJ.zip"
                theme_download
                break
                ;;
            4)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-VBS.zip"
                theme_download
                break
                ;;
            5)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-WxS.zip"
                theme_download
                break
                ;;
            6)
                THM_URL="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-N25.zip"
                theme_download
                break
                ;;
            7)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid selection. Try again."
                ;;
        esac
    done
}

download_cursor() {
    while true; do
        echo "Select cursor type:"
        echo "1) Animated (.ani)"
        echo "2) Static (.cur)"
        echo -e "3) Exit\n"
        read -p "Enter your choice [1-3]: " choice

        case $choice in
            1)
                echo -e "\n"
                animated_cursors
                FMT=".ani"
                break
                ;;
            2)
                echo -e "\n"
                static_cursors
                FMT=".cur"
                break
                ;;
            3)
                echo -e "\nExiting..."
                exit 0
                ;;
            *)
                echo "Invalid selection. Try again."
                ;;
        esac
    done
}

unzip_cursor() {
    EXT_DIR="$HOME/Downloads/$SRC_DIR"
    mkdir -p "$EXT_DIR"

    if unzip -o "$DWD_FNM" -d "$EXT_DIR" > /dev/null 2>&1; then
        echo -e "Extraction successful!\n"
    else
        echo -e "Extraction failed.\n"
        exit 0
    fi
}

python_things() {
    python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
    source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
    pip install win2xcur > /dev/null 2>&1
}

win_to_xcursor() {
    python_things

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
}

copy_assets() {
    cp "$DST_DIR/Unavailable" "$CSR_DIR/03b6e0fcb3499374a867c041f52298f0"
    cp "$DST_DIR/Normal" "$CSR_DIR/3ecb610c1bf2410f44200f48c40d3599"
    cp "$DST_DIR/Help" "$CSR_DIR/5c6cd98b3f3ebcb1f9c7f1c204630408"
    cp "$DST_DIR/Normal" "$CSR_DIR/08e8e1c95fe2fc01f976f1e063a24ccd"
    cp "$DST_DIR/Normal" "$CSR_DIR/9d800788f1b08800ae810202380a0822"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/14fef782d02440884392942c11205230"
    cp "$DST_DIR/Link" "$CSR_DIR/640fb0e74195791501fd1ed57b41487f"
    cp "$DST_DIR/Normal" "$CSR_DIR/1081e37283d90000800003c07f3ef6bf"
    cp "$DST_DIR/Vertical" "$CSR_DIR/2870a09082c103050810ffdffffe0204"
    cp "$DST_DIR/Link" "$CSR_DIR/3085a0e285430894940527032f8b26df"
    cp "$DST_DIR/Move" "$CSR_DIR/4498f0e0c1937ffe01fd06f973665830"
    cp "$DST_DIR/Normal" "$CSR_DIR/6407b0e94181790501fd1e167b474872"
    cp "$DST_DIR/Normal" "$CSR_DIR/00000000000000020006000e7e9ffc3f"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/028006030e0e7ebffc7f7070c0600140"
    cp "$DST_DIR/Move" "$CSR_DIR/9081237383d90e509aa00f00170e968f"
    cp "$DST_DIR/Vertical" "$CSR_DIR/00008160000006810000408080010102"
    cp "$DST_DIR/Link" "$CSR_DIR/a2a266d0498c3104214a47bd64ab0fc8"
    cp "$DST_DIR/Link" "$CSR_DIR/alias"
    cp "$DST_DIR/Move" "$CSR_DIR/all-scroll"
    cp "$DST_DIR/Normal" "$CSR_DIR/arrow"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/bd_double_arrow"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/bottom_left_corner"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/bottom_right_corner"
    cp "$DST_DIR/Vertical" "$CSR_DIR/bottom_side"
    cp "$DST_DIR/Normal" "$CSR_DIR/bottom_tee"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/c7088f0f3e6c8088236ef8e1e3e70000"
    cp "$DST_DIR/Normal" "$CSR_DIR/cell"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/circle"
    cp "$DST_DIR/Move" "$CSR_DIR/closedhand"
    cp "$DST_DIR/Pin" "$CSR_DIR/color-picker"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/col-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/context-menu"
    cp "$DST_DIR/Normal" "$CSR_DIR/copy"
    cp "$DST_DIR/Precision" "$CSR_DIR/cross"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/crossed_circle"
    cp "$DST_DIR/Precision" "$CSR_DIR/crosshair"
    cp "$DST_DIR/Precision" "$CSR_DIR/cross_reverse"
    cp "$DST_DIR/Help" "$CSR_DIR/d9ce0ab605698f320427677b458ad60b"
    cp "$DST_DIR/Normal" "$CSR_DIR/default"
    cp "$DST_DIR/Precision" "$CSR_DIR/diamond_cross"
    cp "$DST_DIR/Help" "$CSR_DIR/dnd-ask"
    cp "$DST_DIR/Normal" "$CSR_DIR/dnd-copy"
    cp "$DST_DIR/Link" "$CSR_DIR/dnd-link"
    cp "$DST_DIR/Move" "$CSR_DIR/dnd-move"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/dnd-no-drop"
    cp "$DST_DIR/Normal" "$CSR_DIR/dnd-none"
    cp "$DST_DIR/Normal" "$CSR_DIR/dotbox"
    cp "$DST_DIR/Normal" "$CSR_DIR/dot_box_mask"
    cp "$DST_DIR/Vertical" "$CSR_DIR/double_arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/down-arrow"
    cp "$DST_DIR/Handwriting" "$CSR_DIR/draft"
    cp "$DST_DIR/Normal" "$CSR_DIR/draft_large"
    cp "$DST_DIR/Normal" "$CSR_DIR/draft_small"
    cp "$DST_DIR/Normal" "$CSR_DIR/draped_box"
    cp "$DST_DIR/Normal" "$CSR_DIR/e29285e634086352946a0e7090d73106"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/e-resize"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/ew-resize"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/fcf1c3c7cd4491d801f1e1c78f100000"
    cp "$DST_DIR/Move" "$CSR_DIR/fcf21c00b30f7e3f83fe0dfd12e71cff"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/fd_double_arrow"
    cp "$DST_DIR/Move" "$CSR_DIR/fleur"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/forbidden"
    cp "$DST_DIR/Move" "$CSR_DIR/grab"
    cp "$DST_DIR/Move" "$CSR_DIR/grabbing"
    cp "$DST_DIR/Working" "$CSR_DIR/half-busy"
    cp "$DST_DIR/Normal" "$CSR_DIR/hand"
    cp "$DST_DIR/Normal" "$CSR_DIR/hand1"
    cp "$DST_DIR/Normal" "$CSR_DIR/hand2"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/h_double_arrow"
    cp "$DST_DIR/Help" "$CSR_DIR/help"
    cp "$DST_DIR/Text" "$CSR_DIR/ibeam"
    cp "$DST_DIR/Normal" "$CSR_DIR/icon"
    cp "$DST_DIR/Normal" "$CSR_DIR/left-arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/left_ptr"
    cp "$DST_DIR/Help" "$CSR_DIR/left_ptr_help"
    cp "$DST_DIR/Working" "$CSR_DIR/left_ptr_watch"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/left_side"
    cp "$DST_DIR/Normal" "$CSR_DIR/left_tee"
    cp "$DST_DIR/Link" "$CSR_DIR/link"
    cp "$DST_DIR/Normal" "$CSR_DIR/ll_angle"
    cp "$DST_DIR/Normal" "$CSR_DIR/lr_angle"
    cp "$DST_DIR/Move" "$CSR_DIR/move"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/ne-resize"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/nesw-resize"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/no-drop"
    cp "$DST_DIR/Unavailable" "$CSR_DIR/not-allowed"
    cp "$DST_DIR/Vertical" "$CSR_DIR/n-resize"
    cp "$DST_DIR/Vertical" "$CSR_DIR/ns-resize"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/nw-resize"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/nwse-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/openhand"
    cp "$DST_DIR/Handwriting" "$CSR_DIR/pencil"
    cp "$DST_DIR/Normal" "$CSR_DIR/pirate"
    cp "$DST_DIR/Normal" "$CSR_DIR/plus"
    cp "$DST_DIR/Normal" "$CSR_DIR/pointer"
    cp "$DST_DIR/Move" "$CSR_DIR/pointer-move"
    cp "$DST_DIR/Normal" "$CSR_DIR/pointing_hand"
    cp "$DST_DIR/Working" "$CSR_DIR/progress"
    cp "$DST_DIR/Help" "$CSR_DIR/question_arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/right-arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/right_ptr"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/right_side"
    cp "$DST_DIR/Normal" "$CSR_DIR/right_tee"
    cp "$DST_DIR/Vertical" "$CSR_DIR/row-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/sb_down_arrow"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/sb_h_double_arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/sb_left_arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/sb_right_arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/sb_up_arrow"
    cp "$DST_DIR/Vertical" "$CSR_DIR/sb_v_double_arrow"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/se-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/size_all"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/size-bdiag"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/size-fdiag"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/size-hor"
    cp "$DST_DIR/Vertical" "$CSR_DIR/size-ver"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/split-h"
    cp "$DST_DIR/Vertical" "$CSR_DIR/split_v"
    cp "$DST_DIR/Vertical" "$CSR_DIR/s-resize"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/sw-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/target"
    cp "$DST_DIR/Precision" "$CSR_DIR/tcross"
    cp "$DST_DIR/Text" "$CSR_DIR/text"
    cp "$DST_DIR/Normal" "$CSR_DIR/top_left_arrow"
    cp "$DST_DIR/Diagonal1" "$CSR_DIR/top_left_corner"
    cp "$DST_DIR/Diagonal2" "$CSR_DIR/top_right_corner"
    cp "$DST_DIR/Vertical" "$CSR_DIR/top_side"
    cp "$DST_DIR/Normal" "$CSR_DIR/top_tee"
    cp "$DST_DIR/Normal" "$CSR_DIR/ul_angle"
    cp "$DST_DIR/Normal" "$CSR_DIR/up-arrow"
    cp "$DST_DIR/Normal" "$CSR_DIR/ur_angle"
    cp "$DST_DIR/Vertical" "$CSR_DIR/v_double_arrow"
    cp "$DST_DIR/Text" "$CSR_DIR/vertical-text"
    cp "$DST_DIR/Working" "$CSR_DIR/wait"
    cp "$DST_DIR/Normal" "$CSR_DIR/wayland-cursor"
    cp "$DST_DIR/Help" "$CSR_DIR/whats_this"
    cp "$DST_DIR/Horizontal" "$CSR_DIR/w-resize"
    cp "$DST_DIR/Normal" "$CSR_DIR/x-cursor"
    cp "$DST_DIR/Normal" "$CSR_DIR/X_cursor"
    cp "$DST_DIR/Text" "$CSR_DIR/xterm"
    cp "$DST_DIR/Normal" "$CSR_DIR/zoom-in"
    cp "$DST_DIR/Normal" "$CSR_DIR/zoom-out"
}

clean_origin() {
    for f in "${files[@]}"; do
        rm -f "$DST_DIR/$f"
    done
}

theme_construct() {
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
}

finishing_touches() {
    echo -e "\nAbout to finish, polishing things...\n"
}

theme_zip() {
    finishing_touches

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
}

theme_install() {
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
}

asset_process() {
    CSR_DIR="$DST_DIR/cursors"
    mkdir -p "$CSR_DIR"

    win_to_xcursor
    copy_assets
    clean_origin
    theme_construct
}

main_function() {
    download_cursor
    unzip_cursor
    asset_process
    theme_zip
    theme_install
}

main_function
echo -e "\e[1;32mFinished setup. Enjoy ColorCursor!\n"
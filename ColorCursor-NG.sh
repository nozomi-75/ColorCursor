#!/bin/bash

asset_source_directory="Miku"
asset_destination_directory="Miku-L"
zip_filename="ps-cur.zip"

sudo apt install python3-pip python3.12-venv wget zip > /dev/null 2>&1
cd ~/Downloads > /dev/null 2>&1

echo -e "\nWelcome to ColorCursor-NG!\n"

theme_download() {
    if wget "$theme_url" -O "$zip_filename" > /dev/null 2>&1; then
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
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-VirtualSinger.zip"
                theme_download
                break
                ;;
            2)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-leoneed.zip"
                theme_download
                break
                ;;
            3)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-MMJ.zip"
                theme_download
                break
                ;;
            4)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-VBS.zip"
                theme_download
                break
                ;;
            5)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation%20WxS.zip"
                theme_download
                break
                ;;
            6)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/ani%20file-animation-N25.zip"
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
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-VirtualSinger.zip"
                theme_download
                break
                ;;
            2)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-leoneed.zip"
                theme_download
                break
                ;;
            3)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-MMJ.zip"
                theme_download
                break
                ;;
            4)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-VBS.zip"
                theme_download
                break
                ;;
            5)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-WxS.zip"
                theme_download
                break
                ;;
            6)
                theme_url="https://www.colorfulstage.com/upload_images/media/Download/cur%20file-static-N25.zip"
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
                format=".ani"
                break
                ;;
            2)
                echo -e "\n"
                static_cursors
                format=".cur"
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
    extraction_directory="$HOME/Downloads/$asset_source_directory"
    mkdir -p "$extraction_directory"

    if unzip -o "$zip_filename" -d "$extraction_directory" > /dev/null 2>&1; then
        echo -e "Extraction successful!\n"
    else
        echo -e "Extraction failed.\n"
        exit 0
    fi
}

python_prereq_setup() {
    python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
    source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
    pip install win2xcur > /dev/null 2>&1
}

win_to_xcursor() {
    python_prereq_setup

    files=(Alternate Busy Diagonal1 Diagonal2 Handwriting Help Horizontal Link Move Normal Person Pin Precision Text Unavailable Vertical Working)

    missing=0
    for f in "${files[@]}"; do
        if [ ! -f "$asset_source_directory/$f$format" ]; then
            echo "Missing file: $asset_source_directory/$f$format"
            missing=1
        fi
    done

    if [ "$missing" -eq 1 ]; then
        echo ""
        echo "Error: Some required $format files are missing."
        echo "Please double-check your asset format and folder."
        rm -rf "$asset_destination_directory"
        exit 1
    fi

    for f in "${files[@]}"; do
        win2xcur "$asset_source_directory/$f$format" -o "$asset_destination_directory/"
    done
}

copy_assets() {
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/03b6e0fcb3499374a867c041f52298f0"
    cp "$asset_destination_directory/Normal" "$cursor_directory/3ecb610c1bf2410f44200f48c40d3599"
    cp "$asset_destination_directory/Help" "$cursor_directory/5c6cd98b3f3ebcb1f9c7f1c204630408"
    cp "$asset_destination_directory/Normal" "$cursor_directory/08e8e1c95fe2fc01f976f1e063a24ccd"
    cp "$asset_destination_directory/Normal" "$cursor_directory/9d800788f1b08800ae810202380a0822"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/14fef782d02440884392942c11205230"
    cp "$asset_destination_directory/Link" "$cursor_directory/640fb0e74195791501fd1ed57b41487f"
    cp "$asset_destination_directory/Normal" "$cursor_directory/1081e37283d90000800003c07f3ef6bf"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/2870a09082c103050810ffdffffe0204"
    cp "$asset_destination_directory/Link" "$cursor_directory/3085a0e285430894940527032f8b26df"
    cp "$asset_destination_directory/Move" "$cursor_directory/4498f0e0c1937ffe01fd06f973665830"
    cp "$asset_destination_directory/Normal" "$cursor_directory/6407b0e94181790501fd1e167b474872"
    cp "$asset_destination_directory/Normal" "$cursor_directory/00000000000000020006000e7e9ffc3f"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/028006030e0e7ebffc7f7070c0600140"
    cp "$asset_destination_directory/Move" "$cursor_directory/9081237383d90e509aa00f00170e968f"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/00008160000006810000408080010102"
    cp "$asset_destination_directory/Link" "$cursor_directory/a2a266d0498c3104214a47bd64ab0fc8"
    cp "$asset_destination_directory/Link" "$cursor_directory/alias"
    cp "$asset_destination_directory/Move" "$cursor_directory/all-scroll"
    cp "$asset_destination_directory/Normal" "$cursor_directory/arrow"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/bd_double_arrow"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/bottom_left_corner"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/bottom_right_corner"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/bottom_side"
    cp "$asset_destination_directory/Normal" "$cursor_directory/bottom_tee"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/c7088f0f3e6c8088236ef8e1e3e70000"
    cp "$asset_destination_directory/Normal" "$cursor_directory/cell"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/circle"
    cp "$asset_destination_directory/Move" "$cursor_directory/closedhand"
    cp "$asset_destination_directory/Pin" "$cursor_directory/color-picker"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/col-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/context-menu"
    cp "$asset_destination_directory/Normal" "$cursor_directory/copy"
    cp "$asset_destination_directory/Precision" "$cursor_directory/cross"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/crossed_circle"
    cp "$asset_destination_directory/Precision" "$cursor_directory/crosshair"
    cp "$asset_destination_directory/Precision" "$cursor_directory/cross_reverse"
    cp "$asset_destination_directory/Help" "$cursor_directory/d9ce0ab605698f320427677b458ad60b"
    cp "$asset_destination_directory/Normal" "$cursor_directory/default"
    cp "$asset_destination_directory/Precision" "$cursor_directory/diamond_cross"
    cp "$asset_destination_directory/Help" "$cursor_directory/dnd-ask"
    cp "$asset_destination_directory/Normal" "$cursor_directory/dnd-copy"
    cp "$asset_destination_directory/Link" "$cursor_directory/dnd-link"
    cp "$asset_destination_directory/Move" "$cursor_directory/dnd-move"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/dnd-no-drop"
    cp "$asset_destination_directory/Normal" "$cursor_directory/dnd-none"
    cp "$asset_destination_directory/Normal" "$cursor_directory/dotbox"
    cp "$asset_destination_directory/Normal" "$cursor_directory/dot_box_mask"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/double_arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/down-arrow"
    cp "$asset_destination_directory/Handwriting" "$cursor_directory/draft"
    cp "$asset_destination_directory/Normal" "$cursor_directory/draft_large"
    cp "$asset_destination_directory/Normal" "$cursor_directory/draft_small"
    cp "$asset_destination_directory/Normal" "$cursor_directory/draped_box"
    cp "$asset_destination_directory/Normal" "$cursor_directory/e29285e634086352946a0e7090d73106"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/e-resize"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/ew-resize"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/fcf1c3c7cd4491d801f1e1c78f100000"
    cp "$asset_destination_directory/Move" "$cursor_directory/fcf21c00b30f7e3f83fe0dfd12e71cff"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/fd_double_arrow"
    cp "$asset_destination_directory/Move" "$cursor_directory/fleur"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/forbidden"
    cp "$asset_destination_directory/Move" "$cursor_directory/grab"
    cp "$asset_destination_directory/Move" "$cursor_directory/grabbing"
    cp "$asset_destination_directory/Working" "$cursor_directory/half-busy"
    cp "$asset_destination_directory/Normal" "$cursor_directory/hand"
    cp "$asset_destination_directory/Normal" "$cursor_directory/hand1"
    cp "$asset_destination_directory/Normal" "$cursor_directory/hand2"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/h_double_arrow"
    cp "$asset_destination_directory/Help" "$cursor_directory/help"
    cp "$asset_destination_directory/Text" "$cursor_directory/ibeam"
    cp "$asset_destination_directory/Normal" "$cursor_directory/icon"
    cp "$asset_destination_directory/Normal" "$cursor_directory/left-arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/left_ptr"
    cp "$asset_destination_directory/Help" "$cursor_directory/left_ptr_help"
    cp "$asset_destination_directory/Working" "$cursor_directory/left_ptr_watch"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/left_side"
    cp "$asset_destination_directory/Normal" "$cursor_directory/left_tee"
    cp "$asset_destination_directory/Link" "$cursor_directory/link"
    cp "$asset_destination_directory/Normal" "$cursor_directory/ll_angle"
    cp "$asset_destination_directory/Normal" "$cursor_directory/lr_angle"
    cp "$asset_destination_directory/Move" "$cursor_directory/move"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/ne-resize"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/nesw-resize"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/no-drop"
    cp "$asset_destination_directory/Unavailable" "$cursor_directory/not-allowed"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/n-resize"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/ns-resize"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/nw-resize"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/nwse-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/openhand"
    cp "$asset_destination_directory/Handwriting" "$cursor_directory/pencil"
    cp "$asset_destination_directory/Normal" "$cursor_directory/pirate"
    cp "$asset_destination_directory/Normal" "$cursor_directory/plus"
    cp "$asset_destination_directory/Normal" "$cursor_directory/pointer"
    cp "$asset_destination_directory/Move" "$cursor_directory/pointer-move"
    cp "$asset_destination_directory/Normal" "$cursor_directory/pointing_hand"
    cp "$asset_destination_directory/Working" "$cursor_directory/progress"
    cp "$asset_destination_directory/Help" "$cursor_directory/question_arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/right-arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/right_ptr"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/right_side"
    cp "$asset_destination_directory/Normal" "$cursor_directory/right_tee"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/row-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/sb_down_arrow"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/sb_h_double_arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/sb_left_arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/sb_right_arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/sb_up_arrow"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/sb_v_double_arrow"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/se-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/size_all"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/size-bdiag"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/size-fdiag"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/size-hor"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/size-ver"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/split-h"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/split_v"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/s-resize"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/sw-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/target"
    cp "$asset_destination_directory/Precision" "$cursor_directory/tcross"
    cp "$asset_destination_directory/Text" "$cursor_directory/text"
    cp "$asset_destination_directory/Normal" "$cursor_directory/top_left_arrow"
    cp "$asset_destination_directory/Diagonal1" "$cursor_directory/top_left_corner"
    cp "$asset_destination_directory/Diagonal2" "$cursor_directory/top_right_corner"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/top_side"
    cp "$asset_destination_directory/Normal" "$cursor_directory/top_tee"
    cp "$asset_destination_directory/Normal" "$cursor_directory/ul_angle"
    cp "$asset_destination_directory/Normal" "$cursor_directory/up-arrow"
    cp "$asset_destination_directory/Normal" "$cursor_directory/ur_angle"
    cp "$asset_destination_directory/Vertical" "$cursor_directory/v_double_arrow"
    cp "$asset_destination_directory/Text" "$cursor_directory/vertical-text"
    cp "$asset_destination_directory/Working" "$cursor_directory/wait"
    cp "$asset_destination_directory/Normal" "$cursor_directory/wayland-cursor"
    cp "$asset_destination_directory/Help" "$cursor_directory/whats_this"
    cp "$asset_destination_directory/Horizontal" "$cursor_directory/w-resize"
    cp "$asset_destination_directory/Normal" "$cursor_directory/x-cursor"
    cp "$asset_destination_directory/Normal" "$cursor_directory/X_cursor"
    cp "$asset_destination_directory/Text" "$cursor_directory/xterm"
    cp "$asset_destination_directory/Normal" "$cursor_directory/zoom-in"
    cp "$asset_destination_directory/Normal" "$cursor_directory/zoom-out"
}

clean_origin() {
    for f in "${files[@]}"; do
        rm -f "$asset_destination_directory/$f"
    done
}

theme_construct() {
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
            zip -r "$theme_dirname".zip "$theme_dirname" > /dev/null 2>&1
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
            sudo cp -r "$theme_dirname" /usr/share/icons/
            echo -e "Successfully installed theme.\n"
        ;;
        * )
            echo -e "Skipped installation of theme.\n"
        ;;
    esac
}

asset_process() {
    cursor_directory="$asset_destination_directory/cursors"
    mkdir -p "$cursor_directory"

    win_to_xcursor
    copy_assets
    clean_origin
    theme_construct
}

main() {
    download_cursor
    unzip_cursor
    asset_process
    theme_zip
    theme_install
}

main
echo -e "\e[1;32mFinished setup. Enjoy ColorCursor!\n"

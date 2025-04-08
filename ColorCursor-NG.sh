#!/bin/bash

# Important configuration variables
BASE_URL="https://www.colorfulstage.com/upload_images/media/Download"
asset_source_directory="Miku"
asset_destination_directory="Miku-L"
source_zip_filename="ps-cur.zip"
download_dir="${HOME}/Downloads"

check_dependencies() {
    for cmd in pip python3 wget zip; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Error: $cmd is not available. Please install dependencies and try again."
            exit 0
        fi
    done

    if ! python3 -m ensurepip --version >/dev/null 2>&1; then
        echo "ensurepip is NOT available. Please check if python3.12-venv is installed."
        exit 0
    fi
}

start() {
    cd "$download_dir" > /dev/null 2>&1
    echo -e "\nWelcome to ColorCursor-NG!\n"
}

theme_download() {
    if wget "$theme_url" -O "$source_zip_filename" > /dev/null 2>&1; then
        echo -e "\nDownload successful!"
    else
        echo -e "\nDownload failed. Please check your internet connection"
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

download_cursors() {
    local cursor_format="$1"
    local cursor_type="$2"

    local cursor_names=(
        "VirtualSinger"
        "leoneed"
        "MMJ"
        "VBS"
        "WxS"
        "N25"
    )

    while true; do
        cursor_choices

        read -p "Please select an option (1-7): " choice

        if ((choice >= 1 && choice <= ${#cursor_names[@]})); then
            theme_url="${BASE_URL}/${cursor_format}%20file-${cursor_type}-${cursor_names[choice-1]}.zip"
            theme_download
            break
        elif ((choice == 7)); then
            echo "Exiting..."
            exit 0
        else
            echo "Invalid selection. Try again."
        fi

    done
}

landing_selection() {
    while true; do
        echo "Select cursor type:"
        echo "1) Animated (.ani)"
        echo "2) Static (.cur)"
        echo -e "3) Exit\n"
        read -p "Please select an option (1-3): " choice

        case $choice in
            1)
                echo -e "\n"
                source_format="ani"
                download_cursors "$source_format" "animation"
                break
                ;;
            2)
                echo -e "\n"
                source_format="cur"
                download_cursors "$source_format" "static"
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

    if unzip -o "$source_zip_filename" -d "$extraction_directory" > /dev/null 2>&1; then
        echo -e "Extraction successful!\n"
    else
        echo -e "Extraction failed.\n"
        exit 0
    fi
}

setup_python_env() {
    python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
    source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
    pip install win2xcur > /dev/null 2>&1
}

win_to_xcursor() {
    setup_python_env

    files=(Alternate Busy Diagonal1 Diagonal2 Handwriting Help Horizontal Link Move Normal Person Pin Precision Text Unavailable Vertical Working)

    missing=0
    for f in "${files[@]}"; do
        if [ ! -f "$asset_source_directory/$f.$source_format" ]; then
            echo "Missing file: $asset_source_directory/$f.$source_format"
            missing=1
        fi
    done

    if [ "$missing" -eq 1 ]; then
        echo ""
        echo "Error: Some required $source_format files are missing."
        echo "Please double-check your asset source_format and folder."
        rm -rf "$asset_destination_directory"
        exit 1
    fi

    for f in "${files[@]}"; do
        win2xcur "$asset_source_directory/$f.$source_format" -o "$asset_destination_directory/"
    done
}

copy_assets() {
    declare -A cursor_map=(
        [Unavailable]="03b6e0fcb3499374a867c041f52298f0 circle dnd-no-drop forbidden no-drop not-allowed"
        [Normal]="3ecb610c1bf2410f44200f48c40d3599 08e8e1c95fe2fc01f976f1e063a24ccd 9d800788f1b08800ae810202380a0822 \
                  1081e37283d90000800003c07f3ef6bf 6407b0e94181790501fd1e167b474872 00000000000000020006000e7e9ffc3f \
                  arrow bottom_tee cell context-menu copy default dnd-copy dnd-none dotbox dot_box_mask down-arrow \
                  draft draft_large draft_small draped_box e29285e634086352946a0e7090d73106 hand hand1 hand2 icon \
                  left-arrow left_ptr left_tee ll_angle lr_angle openhand pirate plus pointer pointing_hand \
                  right-arrow right_ptr right_tee sb_down_arrow sb_left_arrow sb_right_arrow sb_up_arrow \
                  size_all target top_tee ul_angle up-arrow ur_angle wayland-cursor x-cursor X_cursor zoom-in \
                  zoom-out"
        [Help]="5c6cd98b3f3ebcb1f9c7f1c204630408 d9ce0ab605698f320427677b458ad60b help dnd-ask question_arrow \
                left_ptr_help whats_this"
        [Horizontal]="14fef782d02440884392942c11205230 028006030e0e7ebffc7f7070c0600140 col-resize e-resize \
                      ew-resize h_double_arrow left_side right_side sb_h_double_arrow size-hor split-h w-resize"
        [Vertical]="2870a09082c103050810ffdffffe0204 00008160000006810000408080010102 bottom_side double_arrow \
                    ns-resize n-resize s-resize row-resize sb_v_double_arrow size-ver split_v top_side v_double_arrow"
        [Link]="640fb0e74195791501fd1ed57b41487f 3085a0e285430894940527032f8b26df a2a266d0498c3104214a47bd64ab0fc8 \
                alias dnd-link link"
        [Move]="4498f0e0c1937ffe01fd06f973665830 9081237383d90e509aa00f00170e968f all-scroll closedhand \
                dnd-move fleur grab grabbing move pointer-move"
        [Diagonal1]="bd_double_arrow bottom_right_corner c7088f0f3e6c8088236ef8e1e3e70000 nw-resize nwse-resize \
                     se-resize size-fdiag top_left_corner"
        [Diagonal2]="bottom_left_corner fcf1c3c7cd4491d801f1e1c78f100000 fcf21c00b30f7e3f83fe0dfd12e71cff \
                     fd_double_arrow ne-resize nesw-resize size-bdiag sw-resize top_right_corner"
        [Precision]="cross crosshair cross_reverse diamond_cross tcross"
        [Text]="ibeam text vertical-text xterm"
        [Working]="half-busy left_ptr_watch progress wait"
        [Pin]="color-picker"
        [Handwriting]="draft pencil"
    )

    for asset in "${!cursor_map[@]}"; do
        for cursor_name in ${cursor_map[$asset]}; do
            cp "$asset_destination_directory/$asset" "$cursor_directory/$cursor_name"
        done
    done
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
            zip -r "$theme_dirname".zip "$theme_dirname" > /dev/null 2>&1
            echo -e "Successfully zipped theme to $(pwd)/$theme_dirname.zip.\n"
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
    echo -e "Converting assets..."

    win_to_xcursor
    copy_assets
    clean_origin
    theme_construct
}

cleanup() {
    rm -rf "$asset_source_directory"
    rm -rf "$theme_dirname"
    rm -f "$source_zip_filename"
}

main() {
    check_dependencies
    start
    landing_selection
    unzip_cursor
    asset_process
    theme_zip
    theme_install
    cleanup
}

main
echo -e "\e[1;32mFinished setup. Enjoy ColorCursor!\n"

#!/bin/bash
# ColorCursor - A script to convert Windows cursors to Linux format

FILES=(Alternate Busy Diagonal1 Diagonal2 Handwriting Help Horizontal Link Move Normal Person Pin Precision Text Unavailable Vertical Working)

check_dependencies() {
    echo "Checking dependencies..."
    for cmd in pip python3 wget zip; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "Error: $cmd is not installed. Please install dependencies and try again."
            exit 1
        fi
    done

    if ! python3 -m ensurepip --version >/dev/null 2>&1; then
        echo "ensurepip is NOT available. Please check if python3.12-venv is installed."
        exit 0
    fi
}

setup_python_env() {
    python3 -m venv ~/.venvs/win2xcur-env > /dev/null 2>&1
    source ~/.venvs/win2xcur-env/bin/activate > /dev/null 2>&1
    pip install win2xcur > /dev/null 2>&1
}

identify_directories() {
    read -p "Enter the path to the source directory: " asset_source_directory
    if [ ! -d "$asset_source_directory" ]; then
        echo "Error: Source directory '$asset_source_directory' does not exist."
        echo "Please make sure the folder is in the correct location."
        exit 1
    fi

    read -p "Enter the path to the destination directory: " asset_destination_directory
    if [ "$asset_destination_directory" == "$asset_source_directory" ]; then
        echo "Error: Source and destination directories cannot be the same."
        exit 1
    fi
    cursor_directory="$asset_destination_directory/cursors"
    mkdir -p "$cursor_directory"
}

check_files() {
    missing=0
    for f in "${FILES[@]}"; do
        if [ ! -f "$asset_source_directory/$f.cur" ] && [ ! -f "$asset_source_directory/$f.ani" ]; then
            echo "Missing file: $asset_source_directory/$f (.cur or .ani)"
            missing=1
        fi
    done

    if [ "$missing" -eq 1 ]; then
        echo ""
        echo "Error: Some required files are missing."
        echo "Please double-check your asset folder."
        rm -rf "$asset_destination_directory"
        exit 1
    fi
}

initial_conversion() {
    for f in "${FILES[@]}"; do
        if [ -f "$asset_source_directory/$f.cur" ]; then
            win2xcur "$asset_source_directory/$f.cur" -o "$asset_destination_directory/"
        elif [ -f "$asset_source_directory/$f.ani" ]; then
            win2xcur "$asset_source_directory/$f.ani" -o "$asset_destination_directory/"
        fi
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

initial_conversion_cleanup() {
    for f in "${FILES[@]}"; do
        rm -f "$asset_destination_directory/$f"
    done
}

build_theme_files() {
    theme_dirname=$(basename "$asset_source_directory")

    cat > "$theme_dirname/cursor.theme" <<EOF
[Icon Theme]
Name=$theme_dirname
EOF

    cat > "$theme_dirname/index.theme" <<EOF
[Icon Theme]
Name=$theme_dirname
Comment=Linux cursor theme converted by ColorCursor.
EOF

    echo -e "\n"
}

zip_theme() {
    read -p "Do you want to zip the theme? (y/n): " answer
    case ${answer:0:1} in
        y|Y )
            zip -r "$theme_dirname".zip "$theme_dirname" > /dev/null 2>&1
            echo -e "Successfully zipped theme.\n"
        ;;
        * )
            echo -e "Skipped zipping theme.\n"
        ;;
    esac
}

install_theme() {
    read -p "Do you want to install the theme? (y/n): " answer
    case ${answer:0:1} in
        y|Y )
            sudo cp -r "$theme_dirname" ~/.icons/
            echo -e "Successfully installed theme.\n"
        ;;
        * )
            echo -e "Skipped installation of theme.\n"
        ;;
    esac
}

main() {
    check_dependencies
    setup_python_env
    identify_directories
    check_files
    initial_conversion
    copy_assets
    initial_conversion_cleanup
    build_theme_files
    zip_theme
    install_theme

    echo -e "\e[1;32mColorCursor setup complete!\n"
}

main
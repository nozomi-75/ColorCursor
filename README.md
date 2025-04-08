# ColorCursor

A simple script to download and convert Project Sekai cursor assets into a Linux-compatible theme. Inspired by rhythm games and virtual performances.

Special thanks to safeusernameig.

## Features

- Downloads animated (.ani) or static (.cur) cursor assets straight from Colorful Stage.
- Converts Windows cursor files to Linux-compatible formats.
- Creates a complete Linux cursor theme.
- Optionally installs the theme system-wide.
- Supports fallback for missing assets.

## Dependencies

The script requires the following dependencies to work properly:

- **`python3-pip`**: For installing Python packages.
- **`python3.12-venv`**: Required for running the Python virtual environment.
- **`wget`**: For downloading files from the internet.
- **`zip`**: For compressing and extracting files.

Make sure these dependencies are installed on your system before running the script.

## Instructions

You can use either `wget` or `curl` to download and execute the script.

```
wget https://raw.githubusercontent.com/nozomi-75/ColorCursor/refs/heads/main/ColorCursor-NG.sh
bash ColorCursor-NG.sh
```
```
curl -O https://raw.githubusercontent.com/nozomi-75/ColorCursor/refs/heads/main/ColorCursor-NG.sh
bash ColorCursor-NG.sh
```

When using `curl`, do not feed the output directly to `bash`, as it may result in a never-ending loop due to conflicts with the `read` behavior in the script. 

Follow the on-screen prompts to select and process the cursor assets.

## Note

The PRJSK cursor assets are limited to 17 items, which is significantly fewer than the ~140 assets typically used in Linux themes (e.g., [Yaru](https://github.com/ubuntu/yaru)). As a result:
- Some assets will fallback to the "Normal" cursor.
- There may be occasional mismatches between assets.

If you encounter any issues or mismatches, please file an issue or submit a pull request. Contributions are welcome!

## Disclaimer

This repository does not provide or bundle any assets. It downloads from the original source and converts them to usable format. This is deliberate to prevent any copyright infringement. Therefore, you are also requested not to redistribute your converted assets.

HATSUNE MIKU: COLORFUL STAGE! is a copyrighted property of Colorful Palette Inc., Crypton Future Media INC, and SEGA CORPORATION. Reproduction or redistribution without permission from the copyright holder is prohibited.

This repository contains a Bash script that fixes `output-DoseState.R` file output by [`RADDOSE-3D`](https://github.com/GarmanGroup/RADDOSE-3D).

## Steps

1. **Install Chromium**:
   - The script uses `dnf` to install Chromium on Fedora.
   - Ensures Chromium is in the PATH and accessible.

2. **Instructions for Installing `webshot2`**:
   - The script provides messages to guide the user in installing `webshot2` in R.

3. **Modify the R Script**:
   - The script replaces `rgl.viewpoint` with `view3d`.
   - Also replaces `rgl.snapshot` with `snapshot3d` and includes the `width` and `height` parameters.

4. **Run the R Script**:
   - The Bash script runs the modified R script.

5. **Result**:
   - The generated images are saved in the working directory.

## Usage

1. Copy the `fix.sh` to your working directory.
2. Make it executable `chmod +x fix.sh`
3. Run it with `./fix.sh`... and read the output.

Hopefully you can see the images now.

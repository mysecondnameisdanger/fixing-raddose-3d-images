This repository contains a Bash script that fixes `output-DoseState.R` file output by [`RADDOSE-3D`](https://github.com/GarmanGroup/RADDOSE-3D).

## Steps

1. **Install Chromium**:
   - The script uses `dnf` to install Chromium on Fedora.
   - Ensures Chromium is in the PATH and accessible.

2. **Instructions for Installing `webshot2`**:
   - The script will install `webshot2` in R.

3. **Modify the R Script**:
   - The script replaces `rgl.viewpoint` with `view3d`.
   - And it also replaces `rgl.snapshot` with `snapshot3d` including the `width` and `height` parameters.

4. **Run the R Script**:
   - The Bash script runs the modified R script.

5. **Result**:
   - The generated images are saved in the working directory.

## Usage

1. Copy `fix.sh` to your working directory with the results from `RADDOSE-3D`
2. Make it executable `chmod +x fix.sh`
3. Run it with `./fix.sh`...

Hopefully you can see the images now.

## Advice
Always check your `contourlevels`. This works for `b3x11`: `contourlevels<- c(0.05, 0.50, 2.00) # MGy`

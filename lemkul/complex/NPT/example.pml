# Load structure and trajectory
load npt.gro
load_traj npt_noPBC.xtc

# Create selections
select JZ4, resn JZ4
select protein, resi 1-163
select SOL, resn SOL+CLA
deselect

# Smooth simulation
smooth protein, 30, 3

# Modify the representation of the system
hide all
show cartoon
show sticks, JZ4

# Customize the cartoon representation
set cartoon_fancy_helices, 1
set cartoon_highlight_color, grey75
util.chainbow("protein")
set cartoon_transparency, 0.6

# Customize ligand representation
util.cbag resn JZ4
valence guess, all

# Change the background color
bg_color white

# Render image and save as example.png
orient resn JZ4
zoom JZ4, 5
turn y, 180
set ray_trace_mode, 1
set ray_opaque_background, off
ray
png example_1.png, dpi=300

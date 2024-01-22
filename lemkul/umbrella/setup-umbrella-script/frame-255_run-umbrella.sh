#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf255.gro -r conf255.gro -p topol.top -n index.ndx -o npt255.tpr
gmx mdrun -deffnm npt255

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt255.gro -r npt255.gro -t npt255.cpt -p topol.top -n index.ndx -o umbrella255.tpr
gmx mdrun -deffnm umbrella255



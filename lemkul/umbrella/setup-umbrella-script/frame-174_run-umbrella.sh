#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf174.gro -r conf174.gro -p topol.top -n index.ndx -o npt174.tpr
gmx mdrun -deffnm npt174

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt174.gro -r npt174.gro -t npt174.cpt -p topol.top -n index.ndx -o umbrella174.tpr
gmx mdrun -deffnm umbrella174



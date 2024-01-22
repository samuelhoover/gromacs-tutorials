#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf470.gro -r conf470.gro -p topol.top -n index.ndx -o npt470.tpr
gmx mdrun -deffnm npt470

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt470.gro -r npt470.gro -t npt470.cpt -p topol.top -n index.ndx -o umbrella470.tpr
gmx mdrun -deffnm umbrella470



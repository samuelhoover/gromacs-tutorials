#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf327.gro -r conf327.gro -p topol.top -n index.ndx -o npt327.tpr
gmx mdrun -deffnm npt327

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt327.gro -r npt327.gro -t npt327.cpt -p topol.top -n index.ndx -o umbrella327.tpr
gmx mdrun -deffnm umbrella327



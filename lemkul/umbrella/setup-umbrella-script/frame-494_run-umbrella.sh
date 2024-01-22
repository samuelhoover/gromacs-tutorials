#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf494.gro -r conf494.gro -p topol.top -n index.ndx -o npt494.tpr
gmx mdrun -deffnm npt494

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt494.gro -r npt494.gro -t npt494.cpt -p topol.top -n index.ndx -o umbrella494.tpr
gmx mdrun -deffnm umbrella494



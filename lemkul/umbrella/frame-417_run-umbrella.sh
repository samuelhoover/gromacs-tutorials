#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf417.gro -r conf417.gro -p topol.top -n index.ndx -o npt417.tpr
gmx mdrun -deffnm npt417

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt417.gro -r npt417.gro -t npt417.cpt -p topol.top -n index.ndx -o umbrella417.tpr
gmx mdrun -deffnm umbrella417



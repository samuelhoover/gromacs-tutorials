#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf165.gro -r conf165.gro -p topol.top -n index.ndx -o npt165.tpr
gmx mdrun -deffnm npt165

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt165.gro -r npt165.gro -t npt165.cpt -p topol.top -n index.ndx -o umbrella165.tpr
gmx mdrun -deffnm umbrella165



#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf210.gro -r conf210.gro -p topol.top -n index.ndx -o npt210.tpr
gmx mdrun -deffnm npt210

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt210.gro -r npt210.gro -t npt210.cpt -p topol.top -n index.ndx -o umbrella210.tpr
gmx mdrun -deffnm umbrella210



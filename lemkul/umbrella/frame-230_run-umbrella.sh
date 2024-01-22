#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf230.gro -r conf230.gro -p topol.top -n index.ndx -o npt230.tpr
gmx mdrun -deffnm npt230

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt230.gro -r npt230.gro -t npt230.cpt -p topol.top -n index.ndx -o umbrella230.tpr
gmx mdrun -deffnm umbrella230



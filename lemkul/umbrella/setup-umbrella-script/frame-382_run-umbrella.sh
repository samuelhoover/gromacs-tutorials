#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf382.gro -r conf382.gro -p topol.top -n index.ndx -o npt382.tpr
gmx mdrun -deffnm npt382

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt382.gro -r npt382.gro -t npt382.cpt -p topol.top -n index.ndx -o umbrella382.tpr
gmx mdrun -deffnm umbrella382



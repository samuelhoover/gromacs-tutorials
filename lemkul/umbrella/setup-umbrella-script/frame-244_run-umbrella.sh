#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf244.gro -r conf244.gro -p topol.top -n index.ndx -o npt244.tpr
gmx mdrun -deffnm npt244

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt244.gro -r npt244.gro -t npt244.cpt -p topol.top -n index.ndx -o umbrella244.tpr
gmx mdrun -deffnm umbrella244



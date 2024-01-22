#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf430.gro -r conf430.gro -p topol.top -n index.ndx -o npt430.tpr
gmx mdrun -deffnm npt430

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt430.gro -r npt430.gro -t npt430.cpt -p topol.top -n index.ndx -o umbrella430.tpr
gmx mdrun -deffnm umbrella430



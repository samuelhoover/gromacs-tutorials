#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf268.gro -r conf268.gro -p topol.top -n index.ndx -o npt268.tpr
gmx mdrun -deffnm npt268

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt268.gro -r npt268.gro -t npt268.cpt -p topol.top -n index.ndx -o umbrella268.tpr
gmx mdrun -deffnm umbrella268



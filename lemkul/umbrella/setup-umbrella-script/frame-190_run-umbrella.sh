#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf190.gro -r conf190.gro -p topol.top -n index.ndx -o npt190.tpr
gmx mdrun -deffnm npt190

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt190.gro -r npt190.gro -t npt190.cpt -p topol.top -n index.ndx -o umbrella190.tpr
gmx mdrun -deffnm umbrella190



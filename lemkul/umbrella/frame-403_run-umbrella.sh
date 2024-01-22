#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf403.gro -r conf403.gro -p topol.top -n index.ndx -o npt403.tpr
gmx mdrun -deffnm npt403

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt403.gro -r npt403.gro -t npt403.cpt -p topol.top -n index.ndx -o umbrella403.tpr
gmx mdrun -deffnm umbrella403



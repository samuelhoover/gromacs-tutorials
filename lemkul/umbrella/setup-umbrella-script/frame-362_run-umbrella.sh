#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf362.gro -r conf362.gro -p topol.top -n index.ndx -o npt362.tpr
gmx mdrun -deffnm npt362

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt362.gro -r npt362.gro -t npt362.cpt -p topol.top -n index.ndx -o umbrella362.tpr
gmx mdrun -deffnm umbrella362



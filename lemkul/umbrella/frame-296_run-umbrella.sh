#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf296.gro -r conf296.gro -p topol.top -n index.ndx -o npt296.tpr
gmx mdrun -deffnm npt296

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt296.gro -r npt296.gro -t npt296.cpt -p topol.top -n index.ndx -o umbrella296.tpr
gmx mdrun -deffnm umbrella296



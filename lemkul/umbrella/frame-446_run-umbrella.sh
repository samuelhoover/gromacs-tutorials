#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf446.gro -r conf446.gro -p topol.top -n index.ndx -o npt446.tpr
gmx mdrun -deffnm npt446

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt446.gro -r npt446.gro -t npt446.cpt -p topol.top -n index.ndx -o umbrella446.tpr
gmx mdrun -deffnm umbrella446



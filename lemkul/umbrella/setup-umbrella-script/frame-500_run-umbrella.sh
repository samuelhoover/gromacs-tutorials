#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf500.gro -r conf500.gro -p topol.top -n index.ndx -o npt500.tpr
gmx mdrun -deffnm npt500

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt500.gro -r npt500.gro -t npt500.cpt -p topol.top -n index.ndx -o umbrella500.tpr
gmx mdrun -deffnm umbrella500



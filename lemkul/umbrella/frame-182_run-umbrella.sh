#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf182.gro -r conf182.gro -p topol.top -n index.ndx -o npt182.tpr
gmx mdrun -deffnm npt182

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt182.gro -r npt182.gro -t npt182.cpt -p topol.top -n index.ndx -o umbrella182.tpr
gmx mdrun -deffnm umbrella182



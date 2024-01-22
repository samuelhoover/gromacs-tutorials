#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf199.gro -r conf199.gro -p topol.top -n index.ndx -o npt199.tpr
gmx mdrun -deffnm npt199

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt199.gro -r npt199.gro -t npt199.cpt -p topol.top -n index.ndx -o umbrella199.tpr
gmx mdrun -deffnm umbrella199



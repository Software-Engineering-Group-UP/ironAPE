#!/bin/bash
if [ $# -ne 1 ]
	then
		echo "1 argument(s) expected."
		exit
fi
node-88251349=$1

python - << EOF
from pyiron.project import Project
pr = Project('example_project')

structure = pr.create.structure.ase.bulk(Element, cubic=True)

job = pr.create_job(job_type=pr.job_type.Lammps, job_name='lammps')
job.structure = structure

job.potential = '1996--Farkas-D--Nb-Ti-Al--LAMMPS--ipr1'

job.calc_md(temperature=800, pressure=0, n_ionic_steps=10000)

job.run(delete_existing_job=True)

print(job['output/generic/temperature'])
EOF

echo "1. output is: $node-1521153506"
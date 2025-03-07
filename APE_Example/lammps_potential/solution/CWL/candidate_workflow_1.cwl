# WorkflowNo_0
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_0
doc: A workflow including the tool(s) create_project, create_structure_slab, create_job_lammps, select_potential_lammps_meyer, calc_md, run_job_lammps, get_output_MD.

inputs:
  input_1:
    type: File
    format: "unknown"
steps:
  create_project_01:
    run: add-path-to-the-implementation/create_project.cwl 
    in: []
    out: [create_project_out_1]
  create_structure_slab_02:
    run: add-path-to-the-implementation/create_structure_slab.cwl 
    in:
      create_structure_slab_in_1: create_project_01/create_project_out_1
      create_structure_slab_in_2: input_1
    out: [create_structure_slab_out_1]
  create_job_lammps_03:
    run: add-path-to-the-implementation/create_job_lammps.cwl 
    in:
      create_job_lammps_in_1: create_project_01/create_project_out_1
      create_job_lammps_in_2: create_structure_slab_02/create_structure_slab_out_1
    out: [create_job_lammps_out_1]
  select_potential_lammps_meyer_04:
    run: add-path-to-the-implementation/select_potential_lammps_meyer.cwl 
    in:
      select_potential_lammps_meyer_in_1: create_job_lammps_03/create_job_lammps_out_1
      select_potential_lammps_meyer_in_2: input_1
    out: [select_potential_lammps_meyer_out_1]
  calc_md_05:
    run: add-path-to-the-implementation/calc_md.cwl 
    in:
      calc_md_in_1: select_potential_lammps_meyer_04/select_potential_lammps_meyer_out_1
    out: [calc_md_out_1]
  run_job_lammps_06:
    run: add-path-to-the-implementation/run_job_lammps.cwl 
    in:
      run_job_lammps_in_1: calc_md_05/calc_md_out_1
    out: [run_job_lammps_out_1]
  get_output_MD_07:
    run: add-path-to-the-implementation/get_output_MD.cwl 
    in:
      get_output_MD_in_1: run_job_lammps_06/run_job_lammps_out_1
    out: [get_output_MD_out_1]
outputs:
  output_1:
    type: File
    format: "unknown"
    outputSource: get_output_MD_07/get_output_MD_out_1

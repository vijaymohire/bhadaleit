#!/usr/bin/env bash
# create_company_scaffold_full.sh
# Creates the full company scaffold including QAI BareMetal, deployments, command center, tech ecosystem, research hub, admin UI, etc.
# Usage:
#   chmod +x create_company_scaffold_full.sh
#   ./create_company_scaffold_full.sh [root_folder]
# If no root_folder provided, default is "bhadaleit".
# If you pass ".", the scaffold will be created in the current directory (repo root).

set -euo pipefail

# Accept optional root arg
if [ "${1:-}" = "" ]; then
  ROOT="bhadaleit"
else
  ROOT="$1"
fi

echo "Using ROOT = ${ROOT}"

# Full directory list (complete, expanded)
DIRS=(
"${ROOT}/org_framework/01_organization"
"${ROOT}/org_framework/02_org_framework"
"${ROOT}/org_framework/03_org_service_module"
"${ROOT}/org_framework/04_org_product_module"
"${ROOT}/org_framework/05_org_research_module"
"${ROOT}/org_framework/06_org_modernization_module"
"${ROOT}/org_framework/07_org_service_offer"
"${ROOT}/org_framework/08_org_product_offer"
"${ROOT}/org_framework/09_org_research_offer"
"${ROOT}/org_framework/10_org_modernization_offer"
"${ROOT}/org_framework/11_service_offer_procedures"
"${ROOT}/org_framework/12_product_offer_procedures"
"${ROOT}/org_framework/13_research_offer_procedures"
"${ROOT}/org_framework/14_modernization_offer_procedures"
"${ROOT}/org_framework/15_service_offer_steps"
"${ROOT}/org_framework/16_product_offer_steps"
"${ROOT}/org_framework/17_research_offer_steps"
"${ROOT}/org_framework/18_modernization_offer_steps"
"${ROOT}/org_framework/19_service_raw_results"
"${ROOT}/org_framework/20_product_raw_results"
"${ROOT}/org_framework/21_research_raw_results"
"${ROOT}/org_framework/22_modernization_raw_results"
"${ROOT}/org_framework/23_service_optimized_results"
"${ROOT}/org_framework/24_product_optimized_results"
"${ROOT}/org_framework/25_research_optimized_results"
"${ROOT}/org_framework/26_modernization_optimized_results"
"${ROOT}/org_framework/27_service_uat_results"
"${ROOT}/org_framework/28_product_uat_results"
"${ROOT}/org_framework/29_research_uat_results"
"${ROOT}/org_framework/30_modernization_uat_results"
"${ROOT}/org_framework/31_service_operations"
"${ROOT}/org_framework/32_product_operations"
"${ROOT}/org_framework/33_research_operations"
"${ROOT}/org_framework/34_modernization_operations"

# ERP
"${ROOT}/erp/business_intelligence"
"${ROOT}/erp/core_erp"
"${ROOT}/erp/crm_customer_relationship"
"${ROOT}/erp/hr_human_resources"
"${ROOT}/erp/financial_accounting"
"${ROOT}/erp/management_accounting"
"${ROOT}/erp/payrolls_management"
"${ROOT}/erp/procurement_srm"
"${ROOT}/erp/manufacturing_plm"
"${ROOT}/erp/supply_chain_scm"
"${ROOT}/erp/inventory_management"
"${ROOT}/erp/project_program_management"
"${ROOT}/erp/corporate_governance"
"${ROOT}/erp/compliance_legal_govt"
"${ROOT}/erp/risk_management_safety"
"${ROOT}/erp/corporate_banking"
"${ROOT}/erp/e_commerce"
"${ROOT}/erp/enterprise_asset_management"
"${ROOT}/erp/self_services_intranet_extranet"
"${ROOT}/erp/immigration_visa_services"

# operations frameworks
"${ROOT}/operations_frameworks/devops"
"${ROOT}/operations_frameworks/mlops"
"${ROOT}/operations_frameworks/qai_ops"
"${ROOT}/operations_frameworks/research_ops"
"${ROOT}/operations_frameworks/federal_ops"
"${ROOT}/operations_frameworks/cloud_ops"
"${ROOT}/operations_frameworks/sec_ops"
"${ROOT}/operations_frameworks/fin_ops"
"${ROOT}/operations_frameworks/data_ops"
"${ROOT}/operations_frameworks/platform_ops"
"${ROOT}/operations_frameworks/infra_ops"
"${ROOT}/operations_frameworks/compliance_ops"
"${ROOT}/operations_frameworks/biz_ops"
"${ROOT}/operations_frameworks/site_reliability_ops"

# business transformation
"${ROOT}/business_transformation/modernization"
"${ROOT}/business_transformation/digital_transformation"
"${ROOT}/business_transformation/agile_transformation"
"${ROOT}/business_transformation/strategy_alignment"
"${ROOT}/business_transformation/organization_change"
"${ROOT}/business_transformation/client_feedback_loops"

# qai_hub + runtimes + adapters + baremetal framework
"${ROOT}/qai_hub/api_gateway"
"${ROOT}/qai_hub/frameworks/qai_core"
"${ROOT}/qai_hub/frameworks/qai_ops"
"${ROOT}/qai_hub/models"
"${ROOT}/qai_hub/runtimes/cpu_runtime"
"${ROOT}/qai_hub/runtimes/gpu_runtime"
"${ROOT}/qai_hub/runtimes/tpu_runtime"
"${ROOT}/qai_hub/runtimes/quantum_sim_runtime"
"${ROOT}/qai_hub/runtimes/topological_runtime"
"${ROOT}/qai_hub/middleware/message_adapters"
"${ROOT}/qai_hub/simulator/qiskit_aer"
"${ROOT}/qai_hub/adapters/qiskit_adapter"
"${ROOT}/qai_hub/adapters/cirq_adapter"
"${ROOT}/qai_hub/adapters/braket_adapter"
"${ROOT}/qai_hub/adapters/custom_topological_adapter"
"${ROOT}/qai_hub/qai_baremetal_framework/design_patterns"
"${ROOT}/qai_hub/qai_baremetal_framework/runtime_adapters"
"${ROOT}/qai_hub/qai_baremetal_framework/orchestration"
"${ROOT}/qai_hub/qai_baremetal_framework/drivers_firmware"
"${ROOT}/qai_hub/qai_baremetal_framework/low_latency_networks"
"${ROOT}/qai_hub/qai_baremetal_framework/qpu_connectors"
"${ROOT}/qai_hub/qai_baremetal_framework/cryogenics_and_cooling"
"${ROOT}/qai_hub/qai_baremetal_framework/security_airgap_patterns"
"${ROOT}/qai_hub/qai_baremetal_framework/cost_optimization"

# proofs_of_concept
"${ROOT}/proofs_of_concept/poc-001-qai-edge/notebooks"
"${ROOT}/proofs_of_concept/poc-001-qai-edge/src"
"${ROOT}/proofs_of_concept/poc-001-qai-edge/models"
"${ROOT}/proofs_of_concept/poc-001-qai-edge/docker"
"${ROOT}/proofs_of_concept/poc-001-qai-edge/demo"
"${ROOT}/proofs_of_concept/poc-002-qai-monitoring"
"${ROOT}/proofs_of_concept/poc-003-qai-modernization"
"${ROOT}/proofs_of_concept/poc-template"

# industries (example list; each industry has subfolders for HW/Software/etc)
"${ROOT}/industries/pharma_industry/hpc"
"${ROOT}/industries/pharma_industry/quantum_runtimes"
"${ROOT}/industries/pharma_industry/multi_cloud"
"${ROOT}/industries/pharma_industry/os_platforms"
"${ROOT}/industries/pharma_industry/software_engg"
"${ROOT}/industries/pharma_industry/systems_engg"
"${ROOT}/industries/pharma_industry/baremetal_blueprints"

"${ROOT}/industries/health_and_lifescience_sector"
"${ROOT}/industries/ai_robotics"
"${ROOT}/industries/defense"
"${ROOT}/industries/telecom_sector"
"${ROOT}/industries/transportation_sector"
"${ROOT}/industries/space_industry"
"${ROOT}/industries/agriculture_sector"
"${ROOT}/industries/banking_financial_sector"
"${ROOT}/industries/automotive"
"${ROOT}/industries/geology_mining"
"${ROOT}/industries/hospitality_tourism"
"${ROOT}/industries/hr_employment"
"${ROOT}/industries/gaming_entertainment"
"${ROOT}/industries/education"
"${ROOT}/industries/biotechnology"
"${ROOT}/industries/social_sector"
"${ROOT}/industries/government_citizens_sector"
"${ROOT}/industries/green_environmental_tech"
"${ROOT}/industries/retail_fmcg"
"${ROOT}/industries/oil_and_gas"
"${ROOT}/industries/dress_fashion"
"${ROOT}/industries/engineering_industry"

# programs
"${ROOT}/programs/enterprise/defense_initiatives"
"${ROOT}/programs/enterprise/quantum_ai_initiatives"
"${ROOT}/programs/enterprise/genai_initiatives"
"${ROOT}/programs/enterprise/ai_initiatives"
"${ROOT}/programs/enterprise/modernization_offerings"
"${ROOT}/programs/enterprise/sustainable_ecosystems"
"${ROOT}/programs/enterprise/2030_technologies"
"${ROOT}/programs/enterprise/2030_and_beyond_products"
"${ROOT}/programs/enterprise/futuristic_projects"
"${ROOT}/programs/enterprise/space_missions_colonies"
"${ROOT}/programs/enterprise/quantum_wormhole_travel"
"${ROOT}/programs/enterprise/computational_biology"

"${ROOT}/programs/services/software_engineering"
"${ROOT}/programs/services/systems_engineering"
"${ROOT}/programs/services/cost_engineering"
"${ROOT}/programs/services/robotics_engineering"

"${ROOT}/programs/products/agri_climate_aid"
"${ROOT}/programs/products/precision_agriculture_satellite"
"${ROOT}/programs/products/agricultural_tube_farming"
"${ROOT}/programs/products/smart_agriculture_farm_safety"

"${ROOT}/programs/modernization/intelligent_transit_safety"
"${ROOT}/programs/modernization/intelligent_food_supply_logistics"
"${ROOT}/programs/modernization/intelligent_power_distribution"
"${ROOT}/programs/modernization/ai_vigilance_cyber_threats"

"${ROOT}/programs/research/lidar_based_agriculture"
"${ROOT}/programs/research/gis_ai_remote_services"
"${ROOT}/programs/research/soil_morphology_analysis"
"${ROOT}/programs/research/flora_fauna_topography"

# projects top buckets + template
"${ROOT}/projects/services"
"${ROOT}/projects/products"
"${ROOT}/projects/modernization"
"${ROOT}/projects/research"
"${ROOT}/projects/project-templates/baremetal_deployment_template/infra"
"${ROOT}/projects/project-templates/baremetal_deployment_template/playbooks"

# corporate
"${ROOT}/corporate/board_minutes"
"${ROOT}/corporate/legal"
"${ROOT}/corporate/finance"
"${ROOT}/corporate/policies"
"${ROOT}/corporate/secretary_programs"
"${ROOT}/corporate/intl_mobility"
"${ROOT}/corporate/investor_relations"
"${ROOT}/corporate/public_relations_news"
"${ROOT}/corporate/governance_frameworks"
"${ROOT}/corporate/govt_relations"
"${ROOT}/corporate/intl_matters"
"${ROOT}/corporate/clients"
"${ROOT}/corporate/partners"
"${ROOT}/corporate/staff"
"${ROOT}/corporate/corporate_matters"

# enterprise
"${ROOT}/enterprise/partner_mgmt"
"${ROOT}/enterprise/partner_offerings"
"${ROOT}/enterprise/partner_google"
"${ROOT}/enterprise/partner_renewals_licenses"
"${ROOT}/enterprise/enterprise_architecture"
"${ROOT}/enterprise/sovereign_cloud"
"${ROOT}/enterprise/ics_it_ot_cloud"
"${ROOT}/enterprise/nexgen_cloud"
"${ROOT}/enterprise/nexgen_enterprises"
"${ROOT}/enterprise/tech_ecosystem"
"${ROOT}/enterprise/industry_5_0"

# top-level research hub (qai_research_hub)
"${ROOT}/research/qai_research_hub/research_topics/legacy_to_qai_migration"
"${ROOT}/research/qai_research_hub/research_topics/hybrid_qai_models"
"${ROOT}/research/qai_research_hub/research_topics/quantum_networks_and_qram"
"${ROOT}/research/qai_research_hub/research_topics/disruptive_innovations"
"${ROOT}/research/qai_research_hub/research_topics/2030_and_beyond"
"${ROOT}/research/qai_research_hub/research_catalogues"
"${ROOT}/research/operations_research"
"${ROOT}/research/health_and_lifescience"
"${ROOT}/research/cyber_security_initiatives"
"${ROOT}/research/disruptive_solutions_ar"
"${ROOT}/research/onion_framework"
"${ROOT}/research/publications"
"${ROOT}/research/strategy_research"

# delivery
"${ROOT}/delivery/program_management_office/governance"
"${ROOT}/delivery/program_management_office/program_templates"
"${ROOT}/delivery/program_management_office/reporting_dashboards"
"${ROOT}/delivery/program_management_office/benefits_realization"
"${ROOT}/delivery/project_management_office/pm_tools"
"${ROOT}/delivery/project_management_office/project_templates"
"${ROOT}/delivery/project_management_office/resource_pool"
"${ROOT}/delivery/project_delivery_readiness"
"${ROOT}/delivery/onboarding_training"
"${ROOT}/delivery/presales"
"${ROOT}/delivery/demos_poc"

# digital assets
"${ROOT}/digital_assets/catalogues/services_catalogue"
"${ROOT}/digital_assets/catalogues/products_catalogue"
"${ROOT}/digital_assets/catalogues/modernization_catalogue"
"${ROOT}/digital_assets/catalogues/research_catalogue"
"${ROOT}/digital_assets/forms"
"${ROOT}/digital_assets/documents"
"${ROOT}/digital_assets/meetings"
"${ROOT}/digital_assets/board_content"
"${ROOT}/digital_assets/benefits_management"
"${ROOT}/digital_assets/achievements"
"${ROOT}/digital_assets/service_offerings"
"${ROOT}/digital_assets/product_offerings"
"${ROOT}/digital_assets/capabilities"
"${ROOT}/digital_assets/videos"
"${ROOT}/digital_assets/fellowships"
"${ROOT}/digital_assets/papers_to_publish"
"${ROOT}/digital_assets/daily_work_in_progress"
"${ROOT}/digital_assets/knowledge_base"

# datacenters
"${ROOT}/datacenters/qai_datacenter/hybrid_integration"
"${ROOT}/datacenters/qai_datacenter/networking/roce"
"${ROOT}/datacenters/qai_datacenter/networking/100gb_ethernet"
"${ROOT}/datacenters/qai_datacenter/networking/optical_networks"
"${ROOT}/datacenters/qai_datacenter/networking/qos_virtual_switches"
"${ROOT}/datacenters/qai_datacenter/planes/data_plane"
"${ROOT}/datacenters/qai_datacenter/planes/control_plane"
"${ROOT}/datacenters/qai_datacenter/scalability/vertical_scaling"
"${ROOT}/datacenters/qai_datacenter/scalability/horizontal_scaling"
"${ROOT}/datacenters/qai_datacenter/orchestration/network_aware_quantum_orchestrator"
"${ROOT}/datacenters/qai_datacenter/quantum_memory"
"${ROOT}/datacenters/qai_datacenter/security_fault_tolerance"
"${ROOT}/datacenters/quantum_data_center_perspectives/qram"
"${ROOT}/datacenters/quantum_data_center_perspectives/quantum_networks"
"${ROOT}/datacenters/quantum_data_center_perspectives/applications_qc_comm_sensing"
"${ROOT}/datacenters/infrastructures/topologies/clos"
"${ROOT}/datacenters/infrastructures/topologies/fat_tree"
"${ROOT}/datacenters/infrastructures/topologies/hyperx"
"${ROOT}/datacenters/infrastructures/topologies/bcube"
"${ROOT}/datacenters/infrastructures/topologies/dcell"
"${ROOT}/datacenters/infrastructures/entanglement_protocols/emitter_emitter"
"${ROOT}/datacenters/infrastructures/entanglement_protocols/emitter_scatterer"
"${ROOT}/datacenters/infrastructures/entanglement_protocols/scatterer_scatterer"
"${ROOT}/datacenters/infrastructures/orchestrator"
"${ROOT}/datacenters/infrastructures/benchmarks"
"${ROOT}/datacenters/qai_baremetal/rack_layouts/rack-01"
"${ROOT}/datacenters/qai_baremetal/rack_layouts/rack-02"
"${ROOT}/datacenters/qai_baremetal/rack_layouts/rack_layout_templates"
"${ROOT}/datacenters/qai_baremetal/electrical_power/pdu_specs"
"${ROOT}/datacenters/qai_baremetal/electrical_power/power_capacity_planning"
"${ROOT}/datacenters/qai_baremetal/cooling_chillers_cryo/chiller_specs"
"${ROOT}/datacenters/qai_baremetal/cooling_chillers_cryo/cryo_safety_guides"
"${ROOT}/datacenters/qai_baremetal/cabling_and_interconnects/infra_cabling_diagrams"
"${ROOT}/datacenters/qai_baremetal/cabling_and_interconnects/infiniband_designs"
"${ROOT}/datacenters/qai_baremetal/hw_inventory"
"${ROOT}/datacenters/qai_baremetal/hw_maintenance_runbooks"

# infra and baremetal infra
"${ROOT}/infra/providers/gcp"
"${ROOT}/infra/providers/aws"
"${ROOT}/infra/providers/azure"
"${ROOT}/infra/providers/baremetal"
"${ROOT}/infra/modules"
"${ROOT}/infra/terraform/modules"
"${ROOT}/infra/terraform/envs/dev"
"${ROOT}/infra/terraform/envs/test"
"${ROOT}/infra/terraform/envs/prod"
"${ROOT}/infra/gke_clusters"
"${ROOT}/infra/kubeflow_ray"
"${ROOT}/infra/pipelines"
"${ROOT}/infra/ci_cd"
"${ROOT}/infra/secrets_policies"
"${ROOT}/infra/baremetal/maas_configs"
"${ROOT}/infra/baremetal/metal_operator"
"${ROOT}/infra/baremetal/pxe_templates"
"${ROOT}/infra/baremetal/ansible_playbooks"
"${ROOT}/infra/baremetal/terraform-metal"
"${ROOT}/infra/baremetal/monitoring_agent_templates"

# deployments & adapters
"${ROOT}/deployments/profiles/gcp_standard"
"${ROOT}/deployments/profiles/gcp_minimal"
"${ROOT}/deployments/profiles/baremetal_onprem"
"${ROOT}/deployments/profiles/multi_cloud_anthos"
"${ROOT}/deployments/profiles/aws_ecs_profile"
"${ROOT}/deployments/profiles/saas_hosted_profile"
"${ROOT}/deployments/templates"
"${ROOT}/deployment_adapters/adapter_gcp"
"${ROOT}/deployment_adapters/adapter_baremetal"
"${ROOT}/deployment_adapters/adapter_aws"
"${ROOT}/deployment_adapters/adapter_anthos"

# services
"${ROOT}/services/common_services/api/auth_service"
"${ROOT}/services/common_services/api/orchestration_service"
"${ROOT}/services/common_services/api/gateway_service"
"${ROOT}/services/common_services/platform/logging"
"${ROOT}/services/common_services/platform/monitoring"
"${ROOT}/services/microservices"
"${ROOT}/services/integrations"

# admin ui / CRUD / COTS
"${ROOT}/admin_ui/crud_assets/catalogues"
"${ROOT}/admin_ui/crud_assets/documents"
"${ROOT}/admin_ui/crud_assets/forms"
"${ROOT}/admin_ui/crud_assets/meetings"
"${ROOT}/admin_ui/crud_assets/projects"
"${ROOT}/admin_ui/crud_assets/programs"
"${ROOT}/admin_ui/crud_assets/industries"
"${ROOT}/admin_ui/crud_assets/research"
"${ROOT}/admin_ui/crud_assets/delivery"
"${ROOT}/admin_ui/crud_assets/corporate"
"${ROOT}/admin_ui/crud_assets/enterprise"
"${ROOT}/admin_ui/crud_assets/datacenters"
"${ROOT}/admin_ui/crud_assets/baremetal_assets_crud"
"${ROOT}/admin_ui/crud_admin/users/user_profiles"
"${ROOT}/admin_ui/crud_admin/roles/role_definitions"
"${ROOT}/admin_ui/crud_admin/access_policies/iam_policies"
"${ROOT}/admin_ui/crud_admin/audit_logs/activity_logs"
"${ROOT}/admin_ui/crud_cots/sap_erp/connectors"
"${ROOT}/admin_ui/crud_cots/oracle_erp/connectors"
"${ROOT}/admin_ui/crud_cots/ms_dynamics/connectors"
"${ROOT}/admin_ui/crud_cots/salesforce/connectors"
"${ROOT}/admin_ui/crud_cots/jira_confluence/connectors"
"${ROOT}/admin_ui/dashboard"
"${ROOT}/admin_ui/api"
"${ROOT}/admin_ui/scripts/bulk_import"
"${ROOT}/admin_ui/scripts/cleanup"

# command center
"${ROOT}/command_center/org_ops_mappings/mapping_matrix"
"${ROOT}/command_center/org_ops_mappings/drone_surveillance_map"
"${ROOT}/command_center/org_ops_mappings/finance_engine_map"
"${ROOT}/command_center/governance_frameworks/national_qai_governance_v1.1"
"${ROOT}/command_center/governance_frameworks/provincial_mappings"
"${ROOT}/command_center/governance_frameworks/standards_alignment/nist_cybersecurity"
"${ROOT}/command_center/governance_frameworks/standards_alignment/iso27001"
"${ROOT}/command_center/governance_frameworks/standards_alignment/sovereign_cloud"
"${ROOT}/command_center/governance_frameworks/standards_alignment/airgap_layers"
"${ROOT}/command_center/agents/rpa_agents"
"${ROOT}/command_center/agents/llm_agents"
"${ROOT}/command_center/agents/swarm_ops_agents"
"${ROOT}/command_center/agents/forecasting_agents"
"${ROOT}/command_center/agents/threat_detection_agents"
"${ROOT}/command_center/agents/dashboards_connectors"
"${ROOT}/command_center/situation_rooms/central_mission_hub"
"${ROOT}/command_center/situation_rooms/distributed_nodes"
"${ROOT}/command_center/situation_rooms/emergency_ops_room"
"${ROOT}/command_center/situation_rooms/citizen_feedback_portal"
"${ROOT}/command_center/situation_rooms/auto_mis_reports"

# research catalogues and publications area
"${ROOT}/research_catalogues"
"${ROOT}/research_publications"

# tech ecosystem
"${ROOT}/tech_ecosystem/inventory"
"${ROOT}/tech_ecosystem/categories"
"${ROOT}/tech_ecosystem/vendors"
"${ROOT}/tech_ecosystem/product_landscape"
"${ROOT}/tech_ecosystem/role_stack_matrix"
"${ROOT}/tech_ecosystem/selectors"
"${ROOT}/tech_ecosystem/mappings"

# docs and config
"${ROOT}/config"
"${ROOT}/config/environment_templates"
"${ROOT}/config/config.ini"
"${ROOT}/config/cookiecutter.json"
"${ROOT}/docs/architecture"
"${ROOT}/docs/erp_diagrams"
"${ROOT}/docs/org_charts"
"${ROOT}/docs/roadmaps"
"${ROOT}/docs/policies"
"${ROOT}/docs/baremetal_runbooks"
"${ROOT}/docs/cost_roi"
)

echo "Creating ${#DIRS[@]} directories under ./${ROOT} ..."

for d in "${DIRS[@]}"; do
  mkdir -p "$d"
  # add .gitkeep so folder is tracked by Git
  touch "$d/.gitkeep"
done

echo "Creating README placeholders in top-level and key folders..."
# create a README in many high-level folders
TOP_READMES=(
"${ROOT}/README.md"
"${ROOT}/org_framework/README.md"
"${ROOT}/erp/README.md"
"${ROOT}/operations_frameworks/README.md"
"${ROOT}/business_transformation/README.md"
"${ROOT}/qai_hub/README.md"
"${ROOT}/qai_hub/qai_baremetal_framework/README.md"
"${ROOT}/proofs_of_concept/README.md"
"${ROOT}/industries/README.md"
"${ROOT}/programs/README.md"
"${ROOT}/projects/README.md"
"${ROOT}/corporate/README.md"
"${ROOT}/enterprise/README.md"
"${ROOT}/research/README.md"
"${ROOT}/delivery/README.md"
"${ROOT}/digital_assets/README.md"
"${ROOT}/datacenters/README.md"
"${ROOT}/infra/README.md"
"${ROOT}/deployments/README.md"
"${ROOT}/deployment_adapters/README.md"
"${ROOT}/services/README.md"
"${ROOT}/admin_ui/README.md"
"${ROOT}/command_center/README.md"
"${ROOT}/tech_ecosystem/README.md"
"${ROOT}/docs/README.md"
"${ROOT}/config/README.md"
)

echo "Creating README placeholders..."
for r in "${TOP_READMES[@]}"; do
  if [ ! -f "$r" ]; then
    mkdir -p "$(dirname "$r")"
    cat > "$r" <<EOF
# $(basename "$(dirname "$r")")
This folder is part of the Company scaffold (V1.2).
Place relevant artifacts, diagrams, manifests or README content here.
EOF
  fi
done

echo "Creating starter meta files (deployment meta examples, project meta, tech inventory placeholder)..."

# create project template meta
if [ ! -f "${ROOT}/projects/project-templates/baremetal_deployment_template/meta.yaml" ]; then
  mkdir -p "${ROOT}/projects/project-templates/baremetal_deployment_template"
  cat > "${ROOT}/projects/project-templates/baremetal_deployment_template/meta.yaml" <<'YAML'
project_id: baremetal_deployment_template
display_name: "BareMetal Deployment Template"
envs:
  - dev
  - test
  - prod
artifacts_bucket: "gs://<your-bucket>"
description: "Template for on-prem baremetal cluster deployments (MAAS/Ansible/Terraform-metal)"
YAML
fi

# gcp_standard deployment meta
if [ ! -f "${ROOT}/deployments/profiles/gcp_standard/deployment.meta.yaml" ]; then
  mkdir -p "${ROOT}/deployments/profiles/gcp_standard"
  cat > "${ROOT}/deployments/profiles/gcp_standard/deployment.meta.yaml" <<'YAML'
profile_id: gcp_standard
display_name: "GCP — Standard (GKE + Vertex AI)"
description: "Default production profile using GKE with node pools and Vertex AI for models."
hosts:
  - type: gcp
    provider: gcp
    infra_module: infra/providers/gcp/gke_module
    default_region: us-central1
    required_approvals: false
runtimes:
  - kubernetes: true
  - vertex_ai: true
policies:
  cost_center: "ENG"
  max_monthly_cost_usd: 5000
YAML
fi

# baremetal_onprem deployment meta
if [ ! -f "${ROOT}/deployments/profiles/baremetal_onprem/deployment.meta.yaml" ]; then
  mkdir -p "${ROOT}/deployments/profiles/baremetal_onprem"
  cat > "${ROOT}/deployments/profiles/baremetal_onprem/deployment.meta.yaml" <<'YAML'
profile_id: baremetal_onprem
display_name: "BareMetal On-Prem"
hosts:
  - type: baremetal
    provider: onprem
    infra_module: infra/providers/baremetal/maas_module
    site: "dc-nyc-1"
    required_approvals: true
runtimes:
  - kubernetes: optional
  - slurm: true
  - qpu_access: optional
policies:
  cost_center: "HW"
  capex_budget_usd: 200000
YAML
fi

# tech ecosystem inventory placeholder
if [ ! -f "${ROOT}/tech_ecosystem/inventory/tech_ecosystem_inventory_v1.csv" ]; then
  mkdir -p "${ROOT}/tech_ecosystem/inventory"
  cat > "${ROOT}/tech_ecosystem/inventory/tech_ecosystem_inventory_v1.csv" <<'CSV'
Tool Name,Category,Vendor,Usage / Use case,Cloud Support,Roles,Notes
ExampleTool,Category,Vendor,Use case,Cloud/Onprem,Role,Notes
CSV
fi

echo "Scaffold creation complete."

echo
echo "Next steps:"
echo "  cd ${ROOT}    # or remain in current directory if you used '.'"
echo "  git add ."
echo "  git commit -m 'scaffold v1.2 - full company structure with .gitkeep'"
echo "  git push origin main"

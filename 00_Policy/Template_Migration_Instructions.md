## Metadata
---
Artifact_ID: TMP-00-Template_Migration_I
Artifact_Name: Template Migration Instructions - Phase 2.2
Artifact_Type: TMP
Comments: Auto-generated on 2025-10-25
Dependencies: None
Derived_From: 
Description: Template Migration Instructions - Phase 2.2
File_Path: 00_Policy/Template_Migration_Instructions.md
Filled_By: 
GitHub_URL: https://github.com/EhsanLasani/ELA-Main/blob/main/00_Policy/Template_Migration_Instructions.md
Last_Updated: 2025-10-25
Owner: Enterprise Architecture Office (EAO)
Phase: Policy
Process_Group: Policy
Process_Step: N/A
Project_Name: 
Status: Draft
Template_Source: ELA-Template
Validation_Status: Pending
Version: v1.0
---
# Template Migration Instructions - Phase 2.2

## Overview

This document provides detailed migration instructions for moving templates from domain-based folders to phase-based folders within the ELA-Main governance framework.

**Migration Principle**: Distribute domain-based templates to SDLC phase folders based on **WHEN** they are used in the software development lifecycle, not by topic.

**Target Structure**: `00_Policy/Templates/[Phase_Number]_[Phase_Name]/`

|---------------|-----------------|------------|
| 1 | Architecture_Decision_Record_Template.md | `02_Definition/` | Architecture decisions recorded during requirements definition |
| 2 | Architecture_Design_Document_Template.md | `03_Design/` | Detailed architecture designed during Design phase |
| 3 | Functional_Requirements_SRS_Template.md | `02_Definition/` | Functional requirements defined during Definition phase |
| 4 | NFR_Specification_Template.md | `02_Definition/` | Non-functional requirements defined during Definition phase |
| 5 | UX_Design_Standards_Checklist.md | `03_Design/` | UX standards applied during Design phase |

|---------------|-----------------|------------|
| 1 | Data_Governance_Template.md | `02_Definition/` | Data governance requirements defined upfront |
| 2 | OWASP_Compliance_Checklist.md | `06_Testing/` | Security testing checklist used during Testing phase |
| 3 | Security_Requirements_Template.md | `02_Definition/` | Security requirements defined during Definition phase |
| 4 | Threat_Modeling_Template.md | `02_Definition/` | Threat modeling performed early in Definition phase |

|---------------|-----------------|------------|
| 1 | API_Specification_Template.md | `03_Design/` | API contracts designed during Design phase |
| 2 | API_Versioning_Policy.md | `03_Design/` | Versioning policy established during API design |
| 3 | Legacy_Integration_Checklist.md | `05_Systems_Integration/` | Integration checklist used during Systems Integration phase |

|---------------|-----------------|------------|
| 1 | Performance_Testing_Plan.md | `06_Testing/` | Performance tests executed during Testing phase |
| 2 | Quality_Gates_Checklist.md | `06_Testing/` | Quality gates validated during Testing phase |
| 3 | Test_Strategy_Template.md | `02_Definition/` | Test strategy planned during Definition phase |

|---------------|-----------------|------------|
| 1 | DR_BCP_Plan_Template.md | `07_Operations/` | Disaster recovery planned for Operations phase |
| 2 | Environment_Configuration_Template.md | `04_Development/` | Dev environments configured during Development phase |
| 3 | Infrastructure_as_Code_Standards.md | `07_Deployment/` | IaC standards applied during Deployment phase |

|---------------|-----------------|------------|
| 1 | Compliance_Matrix_ISO_IEEE_OWASP.md | `02_Definition/` | Compliance matrix established during Definition phase |
| 2 | Definition_of_Done_Checklist.md | `04_Development/` | DoD checklist used throughout Development phase |
| 3 | Project_Kickoff_Checklist.md | `02_Definition/` | Project kickoff occurs during Definition phase |

|---------------|-----------------|------------|
| 1 | Knowledge_Transfer_Checklist.md | `08_Operations/` | Knowledge transfer happens during Operations handover |
| 2 | Runbook_Template.md | `08_Operations/` | Runbooks created for Operations phase |
| 3 | Technical_Documentation_Template.md | `04_Development/` | Technical docs created during Development phase |

|---------------|-----------------|------------|
| 1 | Dependency_Assessment_Template.md | `02_Definition/` | Dependencies assessed during Definition phase |
| 2 | FinOps_Budget_Tracker.md | `08_Operations/` | Budget tracking continues through Operations phase |

|---------------|-----------------|------------|
| 1 | Innovation_Proposal_Template.md | `09_Change_Management/` | Innovation proposals managed through Change Management |
| 2 | Retrospective_Template.md | `09_Change_Management/` | Retrospectives drive continuous improvement |
| 3 | Technical_Debt_Register.md | `09_Change_Management/` | Technical debt tracked for future changes |

## Migration Steps

1. **Review this document** - Understand the rationale for each template placement
2. **Move templates using Git** - Use `git mv` commands to preserve history
3. **Update README files** - Update phase README files with template references (automated)
4. **Create Guidelines** - Add usage guidelines for each template (automated)
5. **Create Validation** - Add validation checklists for each phase (automated)
6. **Delete empty folders** - Remove domain-based folders after migration
7. **Update cross-references** - Update any internal links pointing to old locations

## Post-Migration Actions (Automated)

After you complete the physical template migration, the following will be automated:

1. ✅ **Update Phase README files** - Add template references with descriptions
2. ✅ **Update Guidelines/README.md** - Add individual template usage guidelines
3. ✅ **Update Validation/README.md** - Add phase exit checklists
4. ✅ **Create Template Cross-Reference Matrix** - Map templates to multiple phases if needed

**Status**: Ready for Migration
**Date Created**: 2025-10-24
**Phase**: 2.2 Template Consolidation
**Next Step**: Execute migration using git commands

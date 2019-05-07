

az network vnet create --name clivnet `
--resource-group unibic  `
--location japaneast `
--address-prefixes 10.2.0.0/16 `
--subnet-name clisubnet `
--subnet-prefixes 10.2.0.0/24

#crate a nsg

az network nsg create `
--name clinsg `
--resource-group unibic

#rules under nsg
az network nsg rule create --name nsgrule1 `
--nsg-name clinsg `
--resource-group unibic `
--access allow `
--priority 150 `
--source-port-range '*' `
--protocol tcp `
--direction inbound `
--destination-port-range 22  `
--source-address-prefixes '*' `
--destination-address-prefixes '*'

az lab vm create --lab-name clilab `
--resource-group unibic `
--name vmclilab2 `
--admin-username clilabuser `
--admin-password passwordcli `
--size standard_ds1_vs `
--image "Ubuntu Servr 16.04 LTS"  `
--ip-configuration public

#


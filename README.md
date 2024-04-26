# DataPower-dynamically-re-registering-and-reconfiguration-script
DataPower DRR for OVA script

In API Connect, Gateway services do not persist their configuration settings by default. Instead, the master configuration is stored on the Management server and the Dynamic Reregistration and Reconfiguration (DRR) mechanism resynchronizes configuration data when needed. The DRR process is used when proper High Availability/Disaster Recovery (HA/DR) is not configured, or if a manual resynchronization is required.

If a Gateway service is not configured properly for resiliency and is restarted, the gateways in the Gateway service will lose the configuration from the Management server. Configuration data from the Management server is maintained on the gateway service according to the gateway peering configuration on the gateways.
  
[drr.sh](drr.sh)

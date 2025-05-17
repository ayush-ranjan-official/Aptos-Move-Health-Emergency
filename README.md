# Emergency Health Info Smart Contract

## Overview

The Emergency Health Info Smart Contract is a decentralized application built on the Aptos blockchain that allows users to store critical medical information in their blockchain wallet. This information can be accessed during emergency situations by authorized parties, potentially saving lives when quick access to medical history is crucial.

## Features

- **Secure Storage**: Store vital health information securely on the blockchain
- **Privacy Control**: Choose who can access your medical information
- **Quick Access**: Emergency services with authorization can instantly retrieve your health data
- **Always Available**: Information is accessible 24/7 without depending on central servers

## Health Information Stored

The contract enables storage of essential medical information:
- Blood type
- Allergies
- Existing medical conditions
- Emergency contact information
- Timestamp of last update
- List of authorized viewers (such as hospitals, doctors, emergency services)

## Smart Contract Functions

### 1. Create Health Record

Initializes a new health record for a user:

```move
public entry fun create_health_record(
    account: &signer, 
    blood_type: String,
    allergies: String,
    medical_conditions: String,
    emergency_contact: String
)
```

### 2. Update Health Info

Updates existing health information and adds new authorized viewers:

```move
public entry fun update_health_info(
    account: &signer,
    blood_type: String,
    allergies: String,
    medical_conditions: String,
    emergency_contact: String,
    authorized_viewer: address
)
```

## Use Cases

- **Medical Emergencies**: First responders can access vital information when a patient is unconscious
- **Travel Safety**: Access your medical information anywhere in the world
- **Chronic Conditions**: Ensure your specific medical needs are known in case of emergency
- **Allergy Alerts**: Make life-threatening allergies known to medical staff quickly

## Installation and Setup

### Prerequisites

- Aptos CLI installed
- An Aptos wallet with testnet/mainnet APT for transaction fees

### Deploy the Contract

1. Clone this repository:
```bash
git clone https://github.com/yourusername/emergency-health-info
cd emergency-health-info
```

2. Compile the contract:
```bash
aptos move compile
```

3. Deploy to the Aptos blockchain:
```bash
aptos move publish
```

## Interacting with the Contract

### Creating Your Health Record

```bash
aptos move run --function-id <ADDRESS>::HealthInfo::create_health_record \
  --args string:"A+" string:"Penicillin" string:"Diabetes" string:"John Doe +1-555-123-4567"
```

### Updating Your Health Record and Adding an Authorized Viewer

```bash
aptos move run --function-id <ADDRESS>::HealthInfo::update_health_info \
  --args string:"A+" string:"Penicillin, Nuts" string:"Diabetes, Hypertension" \
  string:"John Doe +1-555-123-4567" address:0x123456789abcdef
```

## Security Considerations

- Only you can update your health information
- Information is only accessible to addresses you explicitly authorize
- All updates are timestamped to ensure information currency

## Future Enhancements

- Add functionality to revoke access for specific addresses
- Implement temporary access grants for emergency situations
- Create a more granular permission system for different types of medical data
- Add expiration dates for automatically revoking access

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributors

- [Your Name](https://github.com/yourusername)

## Acknowledgments

- Aptos blockchain community
- Medical professionals who provided input on essential emergency information

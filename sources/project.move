module EmergencyInfo::HealthInfo {
    use std::string::{Self, String};
    use aptos_framework::signer;
    
    /// Error codes
    const E_NOT_AUTHORIZED: u64 = 1;
    
    /// Health information struct to store emergency medical data
    struct HealthRecord has key, store {
        blood_type: String,
        allergies: String,
        medical_conditions: String,
        emergency_contact: String,
        last_updated: u64,
        authorized_viewers: vector<address>
    }
    
    /// Initialize a new health record for the user
    public entry fun create_health_record(
        account: &signer, 
        blood_type: String,
        allergies: String,
        medical_conditions: String,
        emergency_contact: String
    ) {
        let sender = signer::address_of(account);
        
        // Create the health record with initial values
        let health_record = HealthRecord {
            blood_type,
            allergies,
            medical_conditions,
            emergency_contact,
            last_updated: aptos_framework::timestamp::now_seconds(),
            authorized_viewers: vector::empty<address>()
        };
        
        // Move the record to the sender's account
        move_to(account, health_record);
    }
    
    /// Update health information or add authorized viewers
    public entry fun update_health_info(
        account: &signer,
        blood_type: String,
        allergies: String,
        medical_conditions: String,
        emergency_contact: String,
        authorized_viewer: address
    ) acquires HealthRecord {
        let sender = signer::address_of(account);
        let record = borrow_global_mut<HealthRecord>(sender);
        
        // Update the health information
        record.blood_type = blood_type;
        record.allergies = allergies;
        record.medical_conditions = medical_conditions;
        record.emergency_contact = emergency_contact;
        record.last_updated = aptos_framework::timestamp::now_seconds();
        
        // Add authorized viewer if not already present
        if (!vector::contains(&record.authorized_viewers, &authorized_viewer)) {
            vector::push_back(&mut record.authorized_viewers, authorized_viewer);
        };
    }
}

class UserValidator < ActiveModel::Validator
    
    def validate(record)

        unless record.primaryPhone.start_with? '0'
            record.errors.add :primaryPhone, "should starts with 0"
        end

        if !record.secondaryPhone.start_with?('0') && record.secondaryPhone.length > 0
            record.errors.add :secondaryPhone, "should starts with 0"
        end

        if record.secondaryPhone.length > 0 && record.secondaryPhone.length < 11
            record.errors.add :secondaryPhone, "length must be 11 characters"
        end

    end
end
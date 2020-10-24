module CustomValidators
    class ReleaseDateValidator < ActiveModel::Validator
        def validate(model)
            if model.release_date > Time.now
                model.errors[:release_date] << 'can\'t be in the future'
            end
        end
    end
end

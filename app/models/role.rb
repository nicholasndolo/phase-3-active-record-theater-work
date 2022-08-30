class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
        audition.location
        end
    end

    # def lead
    #     self.auditions.find do |audition|
    #         audition.hired?
    #     end
    #  self.auditions.where(hired: true).first else "no actor has been hired for this role"
    # end
    def lead
        if auditions.where(hired: true).length > 0
            auditions.where(hired: true)[0]
        else
            'no actor has been hired for this role'
        end
    end

    def understudy
        if auditions.where(hired: true).length > 1
            auditions.where(hired: true)[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end
end



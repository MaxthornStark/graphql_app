module Mutations
  class KillThanos < BaseMutation
    null false

    field :warrior, Types::WarriorType, null: true
    field :errors, [String], null: false

    def resolve
      authorize

      warrior = Warrior.find_by!(name: 'Thanos')

      if warrior.destroy
        successful_response(warrior)
      else
        failure_response(warrior.errors)
      end
    end

    private

    attr_reader :args

    def authorize
      true # hell yeah!
    end

    def successful_response(warrior)
      {
        warrior: warrior,
        errors: []
      }
    end

    def failure_response(errors)
      {
        warrior: nil,
        errors: errors
      }
    end
  end
end

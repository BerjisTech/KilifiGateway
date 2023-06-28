# frozen_string_literal: true

json.array! @store_contacts, partial: 'store_contacts/store_contact', as: :store_contact

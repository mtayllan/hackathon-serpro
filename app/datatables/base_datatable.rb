# frozen_string_literal: true

class BaseDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  protected

  def edit_link(path)
    link_to('Editar', path, class: 'btn btn-warning')
  end

  def destroy_link(path)
    link_to('Excluir', path, class: 'btn btn-danger',
                             method: :delete, data: { confirm: 'Tem certeza?' })
  end
end

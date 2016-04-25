function bootdisk_provision_method_selected() {
  $('div[id*=_provisioning]').hide();
  $('#network_provisioning').show();
  $('#bootdisk_provisioning').show();
  $('#image_selection select').attr('disabled', true);
}
$(document).on('change', '#host_provision_method_bootdisk', bootdisk_provision_method_selected);

$(document).on('ContentLoad', function() {
  if($('#host_provision_method_bootdisk').is(':checked')) {
    bootdisk_provision_method_selected();
  }
});

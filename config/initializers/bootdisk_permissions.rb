# Add permissions
Foreman::AccessControl.map do |map|
  map.security_block :bootdisk do |map|
    map.permission :download_bootdisk, {:hosts => [:bootdisk_iso],
                                        :'bootdisk/disks' => [:generic_iso, :index]}
  end
end

begin
  # Add a new role called 'Boot disk access' if it doesn't exist
  Role.transaction do
    role = Role.find_or_create_by_name("Boot disk access")
    role.update_attribute :permissions, [:download_bootdisk] if role.permissions.empty?
  end
rescue
end

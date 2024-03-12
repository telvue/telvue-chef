mount "/proc" do
  device "proc"
  fstype "proc"
  options %w{bind rw}
  action %i{ mount enable }
end

directory "/mnt/cdrom"
mount "/mnt/cdrom" do
  device "/dev/cdrom"
  action %i{ mount enable }
end

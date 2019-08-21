# frozen_string_literal: true

module SwapSettings
  module Helper
    extend Chef::Mixin::ShellOut

    # get total ram
    def self.total_ram
      command = "cat /proc/meminfo | grep MemTotal | awk '{print int($2/1024)}'"
      shell_out(command).stdout.to_i
    end

    # calculate total hdd
    def self.total_hdd
      command = "df | grep /dev/xvda | awk '{print int($2/1024)}'"
      shell_out(command).stdout.to_i
    end

    # calculate max swap used according to total hdd
    def self.hdd_max_swap
      hdd_max = 0.2 * total_hdd
      hdd_max.to_i
    end

    # calculate used hdd
    def self.used_hdd
      command = "df | grep /dev/xvda | awk '{print int($3/1024)}'"
      shell_out(command).stdout.to_i
    end

    # calculate available hdd
    def self.available_hdd
      command = "df | grep /dev/xvda | awk '{print int($4/1024)}'"
      shell_out(command).stdout.to_i
    end

    # compute swap amount
    def self.compute_swap_amount
      swap_amount = 2024

      swap_amount = 4048 if (total_ram >= 4048) && total_ram < 16_384

      swap_amount = 8192 if (total_ram >= 16_384) && total_ram < 65_536

      swap_amount = hdd_max_swap if swap_amount > hdd_max_swap

      swap_amount
    end
  end
end

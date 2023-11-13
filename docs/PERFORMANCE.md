# Performance Tweaks


## Enable trim operations on SSD/NVME

It's highly recommended to enable fstrim to ensure your SSD or NVME stays in good working condition.

```bash
sudo systemctl enable --now fstrim.timer
```

Some filesystems such as F2FS (continuous TRIM) have a built-in trim operation, meaning that fstrim is not needed.

## Reduce Swappiness and `vfs_cache_pressure`

TODO.

## `zram`/`zswap` tweaking

Zswap is a kernel feature that caches swap pages in RAM, compressing them before storing. It improves performance by reducing disk I/O when the system needs to swap. Zram is a RAM-based swap device that does not require a backing swap device.

```
echo zstd > /sys/module/zswap/parameters/compressor
echo 10 > /sys/module/zswap/parameters/max_pool_percent
```

To make changes be peristent add `zswap.compressor=zstd zswap.max_pool_percent=10` to bootloader kernel parameters.

## AMD P-State Driver

Enable the AMD P-State EPP driver. The default AMD P-State driver may not provide the same benefits as the `acpi-cpufreq` driver.

Add one of the following options to your kernel command line:
- AMD P-State: `amd_pstate=passive``
- AMD P-State-GUIDED: `amd_pstate=guided``
- AMD P-State EPP: `amd_pstate=active``

You can switch between modes at runtime to test the options:

- `echo active | sudo tee /sys/devices/system/cpu/amd_pstate/status` - Autonomous mode, platform considers only the values set for Minimum performance, Maximum performance, and Energy Performance Preference.
- `echo guided | sudo tee /sys/devices/system/cpu/amd_pstate/status` - Guided-autonomous mode, platform sets operating performance level according to the current workload and within limits set by the OS through minimum and maximum performance registers.
- `echo passive | sudo tee /sys/devices/system/cpu/amd_pstate/status` - Non-autonomous mode, platform gets desired performance level from OS directly through Desired Performance Register.

More infromation:

- https://lore.kernel.org/lkml/20221110175847.3098728-1-Perry.Yuan@amd.com/
- https://lore.kernel.org/lkml/20230119115017.10188-1-wyes.karny@amd.com/
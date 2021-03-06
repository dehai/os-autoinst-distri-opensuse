# SUSE's openQA tests
#
# Copyright © 2009-2013 Bernhard M. Wiedemann
# Copyright © 2012-2017 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: Rename gnote title
# Maintainer: Xudong Zhang <xdzhang@suse.com>
# Tags: tc#1436169

use base "x11test";
use strict;
use testapi;
use version_utils 'is_sle';


sub run {
    x11_start_program('gnote');
    send_key "ctrl-n";
    assert_screen 'gnote-new-note', 5;
    send_key "up";
    send_key "up";
    type_string "new title-opensuse\n";
    send_key 'esc';    #back to all notes interface
    send_key_until_needlematch 'gnote-new-note-title-matched', 'down', 6;
    send_key "delete";
    send_key "tab";
    send_key "ret";
    send_key "ctrl-w";
}

1;

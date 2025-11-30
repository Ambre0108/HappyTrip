<?php
session_start();
echo isset($_SESSION['id_utilisateur']) ? "1" : "0";